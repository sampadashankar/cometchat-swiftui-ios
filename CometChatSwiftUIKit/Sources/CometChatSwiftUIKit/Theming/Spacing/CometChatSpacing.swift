//
//  CometChatSpacing.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 30/08/25.
//

import Foundation

import SwiftUI

/// A SwiftUI-friendly spacing configuration for CometChat UIKit.
public struct CometChatSpacing {
    
    // MARK: - Default Spacing Values
    public struct Default {
        public static let s: CGFloat = 2
        public static let s1: CGFloat = 4
        public static let s2: CGFloat = 8
        public static let s3: CGFloat = 12
        public static let s4: CGFloat = 16
        public static let s5: CGFloat = 20
        public static let s6: CGFloat = 24
        public static let s7: CGFloat = 28
        public static let s8: CGFloat = 32
        public static let s9: CGFloat = 36
        public static let s10: CGFloat = 40
        public static let s11: CGFloat = 44
        public static let s12: CGFloat = 48
        public static let s13: CGFloat = 52
        public static let s14: CGFloat = 56
        public static let s15: CGFloat = 60
        public static let s16: CGFloat = 64
        public static let s17: CGFloat = 68
        public static let s18: CGFloat = 72
        public static let s19: CGFloat = 76
        public static let s20: CGFloat = 80
        public static let sMax: CGFloat = 1000
    }
    
    // MARK: - Radius
    @MainActor
    public struct Radius {
        private static var _r: CGFloat?
        public static var r: CGFloat {
            get { _r ?? Default.s }
            set { _r = newValue }
        }
        
        private static var _r1: CGFloat?
        public static var r1: CGFloat {
            get { _r1 ?? Default.s1 }
            set { _r1 = newValue }
        }
        
        private static var _r2: CGFloat?
        public static var r2: CGFloat {
            get { _r2 ?? Default.s2 }
            set { _r2 = newValue }
        }
        
        private static var _r3: CGFloat?
        public static var r3: CGFloat {
            get { _r3 ?? Default.s3 }
            set { _r3 = newValue }
        }
        
        private static var _r4: CGFloat?
        public static var r4: CGFloat {
            get { _r4 ?? Default.s4 }
            set { _r4 = newValue }
        }
        
        private static var _r5: CGFloat?
        public static var r5: CGFloat {
            get { _r5 ?? Default.s5 }
            set { _r5 = newValue }
        }
        
        private static var _r6: CGFloat?
        public static var r6: CGFloat {
            get { _r6 ?? Default.s6 }
            set { _r6 = newValue }
        }
        
        private static var _rMax: CGFloat?
        public static var rMax: CGFloat {
            get { _rMax ?? Default.sMax }
            set { _rMax = newValue }
        }
    }
    
    // MARK: - Padding
    @MainActor
    public struct Padding {
        private static var _p: CGFloat?
        public static var p: CGFloat {
            get { _p ?? Default.s }
            set { _p = newValue }
        }
        
        private static var _p1: CGFloat?
        public static var p1: CGFloat {
            get { _p1 ?? Default.s1 }
            set { _p1 = newValue }
        }
        
        private static var _p2: CGFloat?
        public static var p2: CGFloat {
            get { _p2 ?? Default.s2 }
            set { _p2 = newValue }
        }
        
        private static var _p3: CGFloat?
        public static var p3: CGFloat {
            get { _p3 ?? Default.s3 }
            set { _p3 = newValue }
        }
        
        private static var _p4: CGFloat?
        public static var p4: CGFloat {
            get { _p4 ?? Default.s4 }
            set { _p4 = newValue }
        }
        
        private static var _p5: CGFloat?
        public static var p5: CGFloat {
            get { _p5 ?? Default.s5 }
            set { _p5 = newValue }
        }
        
        private static var _p6: CGFloat?
        public static var p6: CGFloat {
            get { _p6 ?? Default.s6 }
            set { _p6 = newValue }
        }
        
        private static var _p7: CGFloat?
        public static var p7: CGFloat {
            get { _p7 ?? Default.s7 }
            set { _p7 = newValue }
        }
        
        private static var _p8: CGFloat?
        public static var p8: CGFloat {
            get { _p8 ?? Default.s8 }
            set { _p8 = newValue }
        }
        
        private static var _p9: CGFloat?
        public static var p9: CGFloat {
            get { _p9 ?? Default.s9 }
            set { _p9 = newValue }
        }
        
        private static var _p10: CGFloat?
        public static var p10: CGFloat {
            get { _p10 ?? Default.s10 }
            set { _p10 = newValue }
        }
    }
    
    // MARK: - Margin
    @MainActor
    public struct Margin {
        private static var _m: CGFloat?
        public static var m: CGFloat {
            get { _m ?? Default.s }
            set { _m = newValue }
        }
        
        private static var _m1: CGFloat?
        public static var m1: CGFloat {
            get { _m1 ?? Default.s1 }
            set { _m1 = newValue }
        }
        
        private static var _m2: CGFloat?
        public static var m2: CGFloat {
            get { _m2 ?? Default.s2 }
            set { _m2 = newValue }
        }
        
        private static var _m3: CGFloat?
        public static var m3: CGFloat {
            get { _m3 ?? Default.s3 }
            set { _m3 = newValue }
        }
        
        private static var _m4: CGFloat?
        public static var m4: CGFloat {
            get { _m4 ?? Default.s4 }
            set { _m4 = newValue }
        }
        
        private static var _m5: CGFloat?
        public static var m5: CGFloat {
            get { _m5 ?? Default.s5 }
            set { _m5 = newValue }
        }
        
        private static var _m6: CGFloat?
        public static var m6: CGFloat {
            get { _m6 ?? Default.s6 }
            set { _m6 = newValue }
        }
        
        private static var _m7: CGFloat?
        public static var m7: CGFloat {
            get { _m7 ?? Default.s7 }
            set { _m7 = newValue }
        }
        
        private static var _m8: CGFloat?
        public static var m8: CGFloat {
            get { _m8 ?? Default.s8 }
            set { _m8 = newValue }
        }
        
        private static var _m9: CGFloat?
        public static var m9: CGFloat {
            get { _m9 ?? Default.s9 }
            set { _m9 = newValue }
        }
        
        private static var _m10: CGFloat?
        public static var m10: CGFloat {
            get { _m10 ?? Default.s10 }
            set { _m10 = newValue }
        }
        
        private static var _m11: CGFloat?
        public static var m11: CGFloat {
            get { _m11 ?? Default.s11 }
            set { _m11 = newValue }
        }
        
        private static var _m12: CGFloat?
        public static var m12: CGFloat {
            get { _m12 ?? Default.s12 }
            set { _m12 = newValue }
        }
        
        private static var _m13: CGFloat?
        public static var m13: CGFloat {
            get { _m13 ?? Default.s13 }
            set { _m13 = newValue }
        }
        
        private static var _m14: CGFloat?
        public static var m14: CGFloat {
            get { _m14 ?? Default.s14 }
            set { _m14 = newValue }
        }
        
        private static var _m15: CGFloat?
        public static var m15: CGFloat {
            get { _m15 ?? Default.s15 }
            set { _m15 = newValue }
        }
        
        private static var _m16: CGFloat?
        public static var m16: CGFloat {
            get { _m16 ?? Default.s16 }
            set { _m16 = newValue }
        }
        
        private static var _m17: CGFloat?
        public static var m17: CGFloat {
            get { _m17 ?? Default.s17 }
            set { _m17 = newValue }
        }
        
        private static var _m18: CGFloat?
        public static var m18: CGFloat {
            get { _m18 ?? Default.s18 }
            set { _m18 = newValue }
        }
        
        private static var _m19: CGFloat?
        public static var m19: CGFloat {
            get { _m19 ?? Default.s19 }
            set { _m19 = newValue }
        }
        
        private static var _m20: CGFloat?
        public static var m20: CGFloat {
            get { _m20 ?? Default.s20 }
            set { _m20 = newValue }
        }
    }
}
