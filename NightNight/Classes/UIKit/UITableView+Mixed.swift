//
//  UITableView+Mixed.swift
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

public extension UITableView {
    
    public var mixedSeparatorColor: MixedColor? {
        get { return getMixedColor(&Keys.separatorColor) }
        set {
            separatorColor = newValue?.unfold()
            setMixedColor(&Keys.separatorColor, value: newValue)
        }
    }
    
    public var mixedSectionIndexBackgroundColor: MixedColor? {
        get { return getMixedColor(&Keys.sectionIndexBackgroundColor) }
        set {
            sectionIndexBackgroundColor = newValue?.unfold()
            setMixedColor(&Keys.sectionIndexBackgroundColor, value: newValue)
        }
    }
    

    override func _updateCurrentStatus() {
        super._updateCurrentStatus()
        
        if let mixedSeparatorColor = mixedSeparatorColor {
            separatorColor = mixedSeparatorColor.unfold()
        }
        
        if let mixedSectionIndexBackgroundColor = mixedSectionIndexBackgroundColor {
            sectionIndexBackgroundColor = mixedSectionIndexBackgroundColor.unfold()
        }
        
    }
}
