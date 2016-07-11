//
//  UIImageView+Mixed.swift
//  Pods
//
//  Created by Draveness.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
//  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
//  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
//  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
//  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
//  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//


import Foundation

private var mixedImageKey = "mixedImage"
private var mixedHighlightedImageKey = "mixedHighlightedImage"

public extension UIImageView {

    public var mixedImage: MixedImage? {
        get { return objc_getAssociatedObject(self, &mixedImageKey) as? MixedImage }
        set {
            image = newValue?.unfold()
            objc_setAssociatedObject(self, &mixedImageKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    public var mixedHighlightedImage: MixedImage? {
        get { return objc_getAssociatedObject(self, &mixedHighlightedImageKey) as? MixedImage }
        set {
            highlightedImage = newValue?.unfold()
            objc_setAssociatedObject(self, &mixedHighlightedImageKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    override func _updateCurrentStatus() {
        super._updateCurrentStatus()

        if let mixedImage = mixedImage {
            image = mixedImage.unfold()
        }

        if let mixedHighlightedImage = mixedHighlightedImage {
            highlightedImage = mixedHighlightedImage.unfold()
        }

    }
}
