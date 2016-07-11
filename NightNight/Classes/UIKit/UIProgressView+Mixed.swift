//
//  UIProgressView+Mixed.swift
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

public extension UIProgressView {
    
    public var mixedProgressTintColor: MixedColor? {
        get { return getMixedColor(&Keys.progressTintColor) }
        set {
            progressTintColor = newValue?.unfold()
            setMixedColor(&Keys.progressTintColor, value: newValue)
        }
    }
    
    public var mixedTrackTintColor: MixedColor? {
        get { return getMixedColor(&Keys.trackTintColor) }
        set {
            trackTintColor = newValue?.unfold()
            setMixedColor(&Keys.trackTintColor, value: newValue)
        }
    }
    

    override func _updateCurrentStatus() {
        super._updateCurrentStatus()
        
        if let mixedProgressTintColor = mixedProgressTintColor {
            progressTintColor = mixedProgressTintColor.unfold()
        }
        
        if let mixedTrackTintColor = mixedTrackTintColor {
            trackTintColor = mixedTrackTintColor.unfold()
        }
        
    }
}
