Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x230.google.com ([2a00:1450:4010:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X4PF0-0007oy-Mv
 for ath10k@lists.infradead.org; Tue, 08 Jul 2014 06:51:05 +0000
Received: by mail-la0-f48.google.com with SMTP id el20so3577475lab.7
 for <ath10k@lists.infradead.org>; Mon, 07 Jul 2014 23:50:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CABnBrYUz7Wp0aKkBX8JVFUjOdoZV6gss3x2yMRVwO9WhuH26+Q@mail.gmail.com>
References: <CABnBrYU3P5qXd7pE7LJ_K4JeNFLtbZnpsTgvqtpdMs07qz_gGA@mail.gmail.com>
 <CA+BoTQk_YtrHrR6Wi3mMAZxT6EHFBxdUAafp48GqfUcM=HwfZg@mail.gmail.com>
 <CABnBrYXn0T=bW45zR5VivFRhP4BqFswYY93hrjB7rx+azKX9uA@mail.gmail.com>
 <CABnBrYUTKdvUiDha3meiiu08BCqNVBuCgXb7M_Gr4DwhyON3qw@mail.gmail.com>
 <CAJ-Vmo=JKpnoU2p4swTiXeTM0Q2LYWo7-VW_-vnOLb4ufVSO5A@mail.gmail.com>
 <CALhHN=r9_3i3R45Exs59d02XRTa-07WWvBwmGY9pEKufZb3Byw@mail.gmail.com>
 <CABnBrYVANG1cwC8ixD0hGY5guaB3XTP=PAxsf4OfVuZw+iLMaA@mail.gmail.com>
 <CABnBrYUz7Wp0aKkBX8JVFUjOdoZV6gss3x2yMRVwO9WhuH26+Q@mail.gmail.com>
Date: Tue, 8 Jul 2014 08:50:39 +0200
Message-ID: <CALhHN=rHKJS_FHG1yLhdR_JiUG6_T_q8u3RT1vgtzCdJVXbARQ@mail.gmail.com>
Subject: Re: A-MSDU reception not working?
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Denton Gentry <denton.gentry@gmail.com>
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 8 July 2014 08:43, Denton Gentry <denton.gentry@gmail.com> wrote:
> I think I know what is happening now, though I've no idea why. The
> throughput is low because we have many TCP retransmissions. We have
> retransmissions because the TCP checksum is wrong on a number of
> frames, and I do find data corruption in the payload so the checksum
> definitely should be wrong. All of the corrupted frames were
> originally one of the subframes in an A-MSDU packet.
>
> An example follows at the end of this message, as dissected by
> Wireshark. iperf sends a very regular data pattern of "0123456789..."
> over and over. Note how in subframe #2 offset 0x1e0 the bytes "32 33
> 34" have been replaced by "72 36 35"
>
> 01e0  32 33 34 35 36 37 38 39 30 31 72 36 35 35 36 37   2345678901r65567
>
> I added printks at the bottom of ath10k_htt_rx_amsdu immediately
> before the call to ath10k_process_rx. I found this same packet, and we
> see the "72 36 35" corruption in the printk. So I think it happened in
> ath10k_process_rx or before, not anything weird after passing it up to
> mac80211.
>
> [  101.863712] ath10k: 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39 30
> [  101.863727] ath10k: 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35 36
> [  101.863742] ath10k: 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31 32
> [  101.863757] ath10k: 33 34 35 36 37 38 39 30 31 72 36 35 35 36 37 38
> [  101.863773] ath10k: 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33 34
> [  101.863788] ath10k: 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39 30
> [  101.863803] ath10k: 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35 36
>
>
> I've found a number of examples of similar corruption, always with
> between one and four bytes replaced.
>
> 35363738 -> e52c6e07
> 3435 -> b43f
> 3839 -> c238
> 31 -> 7f
> 3435 -> 7436
> 30 -> 50
> 3233 -> bc37
>
Seems this could be because of:

+ /* cfg80211 expect this padding */
+ padding = (4 - (skb->len + sizeof(subframe_hdr))) & 0x3;
+ skb_put(skb, padding);

>
> The packet described above, dissected by Wireshark:
>
> No.     Time        Source                Destination
> Protocol Length Info
>    2235 18.953349   192.168.144.79        192.168.144.13        TCP
>   3112   52697 > 5001 [ACK] Seq=1391553 Ack=1 Win=131760 [TCP CHECKSUM
> INCORRECT] Len=1448 TSval=1298580657 TSecr=4294947481
>
> Frame 2235: 3112 bytes on wire (24896 bits), 3112 bytes captured (24896 bits)
>     Encapsulation type: IEEE 802.11 plus radiotap radio header (23)
>     Arrival Time: Jul  7, 2014 23:03:37.763365000 PDT
>     [Time shift for this packet: 0.000000000 seconds]
>     Epoch Time: 1404799417.763365000 seconds
>     [Time delta from previous captured frame: 0.003476000 seconds]
>     [Time delta from previous displayed frame: 0.515641000 seconds]
>     [Time since reference or first frame: 18.953349000 seconds]
>     Frame Number: 2235
>     Frame Length: 3112 bytes (24896 bits)
>     Capture Length: 3112 bytes (24896 bits)
>     [Frame is marked: False]
>     [Frame is ignored: False]
>     [Protocols in frame: radiotap:wlan:llc:ip:tcp:data:llc:ip:tcp:data]
>     [Coloring Rule Name: TCP]
>     [Coloring Rule String: tcp]
> Radiotap Header v0, Length 38
>     Header revision: 0
>     Header pad: 0
>     Header length: 38
>     Present flags
>         .... .... .... .... .... .... .... ...1 = TSFT: True
>         .... .... .... .... .... .... .... ..1. = Flags: True
>         .... .... .... .... .... .... .... .0.. = Rate: False
>         .... .... .... .... .... .... .... 1... = Channel: True
>         .... .... .... .... .... .... ...0 .... = FHSS: False
>         .... .... .... .... .... .... ..1. .... = dBm Antenna Signal: True
>         .... .... .... .... .... .... .0.. .... = dBm Antenna Noise: False
>         .... .... .... .... .... .... 0... .... = Lock Quality: False
>         .... .... .... .... .... ...0 .... .... = TX Attenuation: False
>         .... .... .... .... .... ..0. .... .... = dB TX Attenuation: False
>         .... .... .... .... .... .0.. .... .... = dBm TX Power: False
>         .... .... .... .... .... 1... .... .... = Antenna: True
>         .... .... .... .... ...0 .... .... .... = dB Antenna Signal: False
>         .... .... .... .... ..0. .... .... .... = dB Antenna Noise: False
>         .... .... .... .... .1.. .... .... .... = RX flags: True
>         .... .... .... .0.. .... .... .... .... = Channel+: False
>         .... .... .... 0... .... .... .... .... = HT information: False
>         .... .... ...0 .... .... .... .... .... = A-MPDU Status: False
>         .... .... ..1. .... .... .... .... .... = VHT information: True
>         ...0 0000 00.. .... .... .... .... .... = Reserved: 0x00000000
>         ..0. .... .... .... .... .... .... .... = Radiotap NS next: False
>         .0.. .... .... .... .... .... .... .... = Vendor NS next: False
>         0... .... .... .... .... .... .... .... = Ext: False
>     MAC timestamp: 78051063
>     Flags: 0x00
>         .... ...0 = CFP: False
>         .... ..0. = Preamble: Long
>         .... .0.. = WEP: False
>         .... 0... = Fragmentation: False
>         ...0 .... = FCS at end: False
>         ..0. .... = Data Pad: False
>         .0.. .... = Bad FCS: False
>         0... .... = Short GI: False
>     Channel frequency: 5745 [A 149]
>     Channel type: 802.11a (0x0140)
>         .... .... ...0 .... = Turbo: False
>         .... .... ..0. .... = Complementary Code Keying (CCK): False
>         .... .... .1.. .... = Orthogonal Frequency-Division
> Multiplexing (OFDM): True
>         .... .... 0... .... = 2 GHz spectrum: False
>         .... ...1 .... .... = 5 GHz spectrum: True
>         .... ..0. .... .... = Passive: False
>         .... .0.. .... .... = Dynamic CCK-OFDM: False
>         .... 0... .... .... = Gaussian Frequency Shift Keying (GFSK): False
>         ...0 .... .... .... = GSM (900MHz): False
>         ..0. .... .... .... = Static Turbo: False
>         .0.. .... .... .... = Half Rate Channel (10MHz Channel Width): False
>         0... .... .... .... = Quarter Rate Channel (5MHz Channel Width): False
>     SSI Signal: -53 dBm
>     Antenna: 0
>     RX flags: 0x0000
>         .... .... .... .... .... ..0. = Bad PLCP: False
>     VHT information
>         Known VHT information: 0x44
>             .... .... .... ...0 = STBC: False
>             .... .... .... ..0. = TXOP_PS_NOT_ALLOWED: False
>             .... .... .... .1.. = Guard interval: True
>             .... .... .... 0... = SGI Nsym disambiguation: False
>             .... .... ...0 .... = LDPC extra OFDM symbol: False
>             .... .... ..0. .... = Beamformed: False
>             .... .... .1.. .... = Bandwidth: True
>             .... .... 0... .... = Group ID: False
>             .... ...0 .... .... = Partial AID: False
>         .... .0.. = Guard interval: long (0)
>         Bandwidth: 80 MHz (4)
>         User 0: MCS 8
>             1000 .... = MCS index 0: 8 (256-QAM 3/4)
>             .... 0010 = Spatial streams 0: 2
>             Space-time streams 0: 2
>             Coding 0: BCC (0)
>             [Data Rate: 702.0 Mb/s]
> IEEE 802.11 QoS Data, Flags: .......T
>     Type/Subtype: QoS Data (0x28)
>     Frame Control Field: 0x8801
>         .... ..00 = Version: 0
>         .... 10.. = Type: Data frame (2)
>         1000 .... = Subtype: 8
>         Flags: 0x01
>             .... ..01 = DS status: Frame from STA to DS via an AP (To
> DS: 1 From DS: 0) (0x01)
>             .... .0.. = More Fragments: This is the last fragment
>             .... 0... = Retry: Frame is not being retransmitted
>             ...0 .... = PWR MGT: STA will stay up
>             ..0. .... = More Data: No data buffered
>             .0.. .... = Protected flag: Data is not protected
>             0... .... = Order flag: Not strictly ordered
>     .000 0000 0011 0000 = Duration: 48 microseconds
>     Receiver address: SenaoNet_18:a8:00 (88:dc:96:18:a8:00)
>     BSS Id: SenaoNet_18:a8:00 (88:dc:96:18:a8:00)
>     Transmitter address: Apple_67:24:54 (84:38:35:67:24:54)
>     Source address: Apple_67:24:54 (84:38:35:67:24:54)
>     Destination address: SenaoNet_18:a8:00 (88:dc:96:18:a8:00)
>     Fragment number: 0
>     Sequence number: 1021
>     Qos Control: 0x0080
>         .... .... .... 0000 = TID: 0
>         [.... .... .... .000 = Priority: Best Effort (Best Effort) (0)]
>         .... .... ...0 .... = QoS bit 4: Bits 8-15 of QoS Control
> field are TXOP Duration Requested
>         .... .... .00. .... = Ack Policy: Normal Ack (0x0000)
>         .... .... 1... .... = Payload Type: A-MSDU
>         0000 0000 .... .... = TXOP Duration Requested: 0 (no TXOP requested)
> IEEE 802.11 Aggregate MSDU
>     A-MSDU Subframe #1
>         Destination address: GoogleFi_00:14:cd (f8:8f:ca:00:14:cd)
>         Source address: Apple_67:24:54 (84:38:35:67:24:54)
>         A-MSDU Length: 1510
>         Logical-Link Control
>             DSAP: SNAP (0xaa)
>             IG Bit: Individual
>             SSAP: SNAP (0xaa)
>             CR Bit: Command
>             Control field: U, func=UI (0x03)
>                 000. 00.. = Command: Unnumbered Information (0x00)
>                 .... ..11 = Frame type: Unnumbered frame (0x03)
>             Organization Code: Encapsulated Ethernet (0x000000)
>             Type: IP (0x0800)
>         Internet Protocol Version 4, Src: 192.168.144.79
> (192.168.144.79), Dst: 192.168.144.13 (192.168.144.13)
>             Version: 4
>             Header length: 20 bytes
>             Differentiated Services Field: 0x00 (DSCP 0x00: Default;
> ECN: 0x00: Not-ECT (Not ECN-Capable Transport))
>                 0000 00.. = Differentiated Services Codepoint: Default (0x00)
>                 .... ..00 = Explicit Congestion Notification: Not-ECT
> (Not ECN-Capable Transport) (0x00)
>             Total Length: 1500
>             Identification: 0xc622 (50722)
>             Flags: 0x00
>                 0... .... = Reserved bit: Not set
>                 .0.. .... = Don't fragment: Not set
>                 ..0. .... = More fragments: Not set
>             Fragment offset: 0
>             Time to live: 64
>             Protocol: TCP (6)
>             Header checksum: 0x0d4c [correct]
>                 [Good: True]
>                 [Bad: False]
>             Source: 192.168.144.79 (192.168.144.79)
>             Destination: 192.168.144.13 (192.168.144.13)
>             [Source GeoIP: Unknown]
>             [Destination GeoIP: Unknown]
>         Transmission Control Protocol, Src Port: 52697 (52697), Dst
> Port: 5001 (5001), Seq: 1390105, Ack: 1, Len: 1448
>             Source port: 52697 (52697)
>             Destination port: 5001 (5001)
>             [Stream index: 0]
>             Sequence number: 1390105    (relative sequence number)
>             [Next sequence number: 1391553    (relative sequence number)]
>             Acknowledgment number: 1    (relative ack number)
>             Header length: 32 bytes
>             Flags: 0x010 (ACK)
>                 000. .... .... = Reserved: Not set
>                 ...0 .... .... = Nonce: Not set
>                 .... 0... .... = Congestion Window Reduced (CWR): Not set
>                 .... .0.. .... = ECN-Echo: Not set
>                 .... ..0. .... = Urgent: Not set
>                 .... ...1 .... = Acknowledgment: Set
>                 .... .... 0... = Push: Not set
>                 .... .... .0.. = Reset: Not set
>                 .... .... ..0. = Syn: Not set
>                 .... .... ...0 = Fin: Not set
>             Window size value: 8235
>             [Calculated window size: 131760]
>             [Window size scaling factor: 16]
>             Checksum: 0xa1c0 [correct]
>                 [Good Checksum: True]
>                 [Bad Checksum: False]
>             Options: (12 bytes), No-Operation (NOP), No-Operation
> (NOP), Timestamps
>                 No-Operation (NOP)
>                     Type: 1
>                         0... .... = Copy on fragmentation: No
>                         .00. .... = Class: Control (0)
>                         ...0 0001 = Number: No-Operation (NOP) (1)
>                 No-Operation (NOP)
>                     Type: 1
>                         0... .... = Copy on fragmentation: No
>                         .00. .... = Class: Control (0)
>                         ...0 0001 = Number: No-Operation (NOP) (1)
>                 Timestamps: TSval 1298580657, TSecr 4294947481
>                     Kind: Timestamp (8)
>                     Length: 10
>                     Timestamp value: 1298580657
>                     Timestamp echo reply: 4294947481
>         Data (1448 bytes)
>
> 0000  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 0010  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 0020  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 0030  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 0040  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 0050  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 0060  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 0070  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 0080  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 0090  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 00a0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 00b0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 00c0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 00d0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 00e0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 00f0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 0100  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 0110  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 0120  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 0130  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 0140  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 0150  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 0160  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 0170  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 0180  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 0190  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 01a0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 01b0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 01c0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 01d0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 01e0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 01f0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 0200  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 0210  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 0220  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 0230  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 0240  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 0250  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 0260  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 0270  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 0280  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 0290  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 02a0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 02b0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 02c0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 02d0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 02e0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 02f0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 0300  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 0310  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 0320  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 0330  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 0340  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 0350  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 0360  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 0370  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 0380  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 0390  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 03a0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 03b0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 03c0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 03d0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 03e0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 03f0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 0400  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 0410  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 0420  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 0430  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 0440  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 0450  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 0460  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 0470  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 0480  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 0490  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 04a0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 04b0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 04c0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 04d0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 04e0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 04f0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 0500  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 0510  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 0520  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 0530  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 0540  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 0550  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 0560  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 0570  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 0580  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 0590  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 05a0  34 35 36 37 38 39 30 31                           45678901
>             Data: 343536373839303132333435363738393031323334353637...
>             [Length: 1448]
>     A-MSDU Subframe #2
>         Destination address: GoogleFi_00:14:cd (f8:8f:ca:00:14:cd)
>         Source address: Apple_67:24:54 (84:38:35:67:24:54)
>         A-MSDU Length: 1510
>         Logical-Link Control
>             DSAP: SNAP (0xaa)
>             IG Bit: Individual
>             SSAP: SNAP (0xaa)
>             CR Bit: Command
>             Control field: U, func=UI (0x03)
>                 000. 00.. = Command: Unnumbered Information (0x00)
>                 .... ..11 = Frame type: Unnumbered frame (0x03)
>             Organization Code: Encapsulated Ethernet (0x000000)
>             Type: IP (0x0800)
>         Internet Protocol Version 4, Src: 192.168.144.79
> (192.168.144.79), Dst: 192.168.144.13 (192.168.144.13)
>             Version: 4
>             Header length: 20 bytes
>             Differentiated Services Field: 0x00 (DSCP 0x00: Default;
> ECN: 0x00: Not-ECT (Not ECN-Capable Transport))
>                 0000 00.. = Differentiated Services Codepoint: Default (0x00)
>                 .... ..00 = Explicit Congestion Notification: Not-ECT
> (Not ECN-Capable Transport) (0x00)
>             Total Length: 1500
>             Identification: 0xda09 (55817)
>             Flags: 0x00
>                 0... .... = Reserved bit: Not set
>                 .0.. .... = Don't fragment: Not set
>                 ..0. .... = More fragments: Not set
>             Fragment offset: 0
>             Time to live: 64
>             Protocol: TCP (6)
>             Header checksum: 0xf964 [correct]
>                 [Good: True]
>                 [Bad: False]
>             Source: 192.168.144.79 (192.168.144.79)
>             Destination: 192.168.144.13 (192.168.144.13)
>             [Source GeoIP: Unknown]
>             [Destination GeoIP: Unknown]
>         Transmission Control Protocol, Src Port: 52697 (52697), Dst
> Port: 5001 (5001), Seq: 1391553, Ack: 1, Len: 1448
>             Source port: 52697 (52697)
>             Destination port: 5001 (5001)
>             [Stream index: 0]
>             Sequence number: 1391553    (relative sequence number)
>             [Next sequence number: 1393001    (relative sequence number)]
>             Acknowledgment number: 1    (relative ack number)
>             Header length: 32 bytes
>             Flags: 0x010 (ACK)
>                 000. .... .... = Reserved: Not set
>                 ...0 .... .... = Nonce: Not set
>                 .... 0... .... = Congestion Window Reduced (CWR): Not set
>                 .... .0.. .... = ECN-Echo: Not set
>                 .... ..0. .... = Urgent: Not set
>                 .... ...1 .... = Acknowledgment: Set
>                 .... .... 0... = Push: Not set
>                 .... .... .0.. = Reset: Not set
>                 .... .... ..0. = Syn: Not set
>                 .... .... ...0 = Fin: Not set
>             Window size value: 8235
>             [Calculated window size: 131760]
>             [Window size scaling factor: 16]
>             Checksum: 0x9a16 [incorrect, should be 0x5913 (maybe
> caused by "TCP checksum offload"?)]
>                 [Good Checksum: False]
>                 [Bad Checksum: True]
>                     [Expert Info (Error/Checksum): Bad checksum]
>                         [Message: Bad checksum]
>                         [Severity level: Error]
>                         [Group: Checksum]
>             Options: (12 bytes), No-Operation (NOP), No-Operation
> (NOP), Timestamps
>                 No-Operation (NOP)
>                     Type: 1
>                         0... .... = Copy on fragmentation: No
>                         .00. .... = Class: Control (0)
>                         ...0 0001 = Number: No-Operation (NOP) (1)
>                 No-Operation (NOP)
>                     Type: 1
>                         0... .... = Copy on fragmentation: No
>                         .00. .... = Class: Control (0)
>                         ...0 0001 = Number: No-Operation (NOP) (1)
>                 Timestamps: TSval 1298580657, TSecr 4294947481
>                     Kind: Timestamp (8)
>                     Length: 10
>                     Timestamp value: 1298580657
>                     Timestamp echo reply: 4294947481
>         Data (1448 bytes)
>
> 0000  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 0010  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 0020  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 0030  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 0040  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 0050  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 0060  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 0070  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 0080  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 0090  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 00a0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 00b0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 00c0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 00d0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 00e0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 00f0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 0100  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 0110  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 0120  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 0130  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 0140  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 0150  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 0160  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 0170  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 0180  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 0190  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 01a0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 01b0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 01c0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 01d0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 01e0  32 33 34 35 36 37 38 39 30 31 72 36 35 35 36 37   2345678901r65567
> 01f0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 0200  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 0210  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 0220  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 0230  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 0240  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 0250  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 0260  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 0270  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 0280  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 0290  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 02a0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 02b0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 02c0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 02d0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 02e0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 02f0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 0300  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 0310  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 0320  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 0330  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 0340  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 0350  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 0360  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 0370  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 0380  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 0390  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 03a0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 03b0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 03c0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 03d0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 03e0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 03f0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 0400  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 0410  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 0420  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 0430  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 0440  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 0450  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 0460  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 0470  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 0480  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 0490  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 04a0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 04b0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 04c0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 04d0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 04e0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 04f0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 0500  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 0510  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 0520  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 0530  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 0540  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 0550  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
> 0560  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
> 0570  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
> 0580  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
> 0590  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
> 05a0  32 33 34 35 36 37 38 39                           23456789
>             Data: 323334353637383930313233343536373839303132333435...
>             [Length: 1448]
>
> On Mon, Jul 7, 2014 at 12:26 PM, Denton Gentry <denton.gentry@gmail.com> wrote:
>> The initial results are not promising: a MacOS 802.11ac client gets
>> between 0-2 Mbps with this change, where it was getting about 8 Mbps
>> prior to this change and ~170 Mbps prior to the reordering fix. A pcap
>> from the receiving system shows a very large number of out of order
>> frames, likely due to TCP retransmission.
>>
>> An 802.11n MacBook gets very good throughput, only the 802.11ac
>> MacBook shows the very poor result. I'm trying to figure out why.
>>
>>
>> One specific note (and probably not related to the throughput): I
>> believe ath10k_htt_rx_amsdu runs in the tasklet, which means it would
>> need to use GFP_ATOMIC instead of GFP_KERNEL. Do I understand it
>> correctly?
>>
>>
>> On Mon, Jul 7, 2014 at 1:30 AM, Janusz Dziedzic
>> <janusz.dziedzic@tieto.com> wrote:
>>> On 6 July 2014 04:27, Adrian Chadd <adrian@freebsd.org> wrote:
>>>> I think you may have to tell mac80211 that it's okay and not to drop the frames.
>>>>
>>>> The earlier atheros chips would just give you the AMSDU frames as
>>>> deaggregated A-MPDU sub-frames - you'd just pass the A-MSDU up to
>>>> net80211 and it'd ull it apart. But if the driver is doing it (or,
>>>> well, the chip is doing it) then mac80211 needs to know not to drop
>>>> those sub-frames.
>>>>
>>>> I wonder if you'll ever get notified before the complete A-MPDU has
>>>> been received. That happens on previous chips. eg, you have an A-MPDU
>>>> of 16 frames with 4 MSDUs in each MPDU. If you get notified and handle
>>>> half of one MPDU before you hit EOL, the next notification you process
>>>> will be the next MSDU in the same MPDU - and then you'll hit the
>>>> reordering hilarity again.
>>>>
>>>> So hm, i will face the same issue in FreeBSD at some point, so I'd
>>>> likely do what you're thinking of doing - pass up a chain of mbufs
>>>> representing the current MPDU and treat the whole lot as the frame(s)
>>>> to care about. Honestly though, I'm kind of wondering whether I should
>>>> mostly just do what the Atheros reference driver does and treat it as
>>>> ethernet payload frames (ie, it's already de-encapsulated and the
>>>> reordering is already done) and just tack on the wifi header bit via
>>>> another of the DMA rings.
>>>>
>>>> Ugh, I really should sit down and write the FreeBSD version of this.
>>>>
>>>>
>>>>
>>>> -a
>>>>
>>>> (I'm still having flashbacks from working on this firmware at QCA. Aiee.)
>>>>
>>>>
>>>> On 5 July 2014 06:55, Denton Gentry <denton.gentry@gmail.com> wrote:
>>>>> There are two issues in handling the dis-aggregated A-MSDU subframes
>>>>> in ieee80211_sta_manage_reorder_buf:
>>>>>
>>>>> 1. The out-of-date check:
>>>>>
>>>>>         /* frame with out of date sequence number */
>>>>>         if (ieee80211_sn_less(mpdu_seq_num, head_seq_num)) {
>>>>>                 dev_kfree_skb(skb);
>>>>>                 goto out;
>>>>>         }
>>>>>
>>>>> As all of the subframes carry the same sequence number, the first
>>>>> subframe will be delivered and increment head_seq_num and then all
>>>>> subsequent subframes will be discarded.
>>>>>
>>>>>
>>>>> 2. The duplicates check a bit later in the routine:
>>>>>
>>>>>         /* check if we already stored this frame */
>>>>>         if (tid_agg_rx->reorder_buf[index]) {
>>>>>                 dev_kfree_skb(skb);
>>>>>                 goto out;
>>>>>         }
>>>>>
>>>>> If there is enough packet loss that packets are queued in the reorder
>>>>> buffer and not immediately released, then only the first subframe will
>>>>> be stored. Subsequent subframes will be discarded as duplicates.
>>>>>
>>>>>
>>>>> An 802.11ac MacBook is able to get about 170 Mbps with iperf prior to
>>>>> the reordering buffer changes, and dropped to about 8 Mbps with the
>>>>> reorder buffer. Hacking around the out-of-date sequence number check
>>>>> to allow all subframes to egress restores it to 170 Mbps.
>>>>>
>>>>> In the area where I'm testing there isn't enough 5 GHz noise to make
>>>>> the duplicates-check issue happen very often. By adding a printk I can
>>>>> see that it does happen, but it doesn't impact the throughput and I
>>>>> can't report the impact of fixing it.
>>>>>
>>>>> ----
>>>>>
>>>>> I do wonder if both of these are symptoms of dis-aggregating the
>>>>> A-MSDU too early. mac80211 expects to be dealing with the whole MPDU
>>>>> at a time, and the ath10k A-MSDU case is sending it subframes instead.
>>>>> Trying to make the ath10k code send up all of the subframes as a chain
>>>>> of skbs didn't immediately work, but I do wonder if that would better
>>>>> match the mac80211 expectations.
>>>>>
>>>>>
>>>>>
>>>>> On Fri, Jul 4, 2014 at 11:58 AM, Denton Gentry <denton.gentry@gmail.com> wrote:
>>>>>> Yes, after some more testing it does look like an unfortunate
>>>>>> interaction between the reorder buffer and A-MSDU. The disaggregated
>>>>>> subframes all carry the same sequence number. The first subframe is
>>>>>> released from the reorder buffer and increments the head_seq_num.
>>>>>> Subsequent subframes are all discarded as being out of date.
>>>>>>
>>>>>> [  308.514021] ieee80211_sta_manage_reorder_buf: out of date seq=0xb05
>>>>>> head=0xb06
>>>>>> [  308.520577] ieee80211_sta_manage_reorder_buf: out of date seq=0xb0a
>>>>>> head=0xb0b
>>>>>> [  308.527198] ieee80211_sta_manage_reorder_buf: out of date seq=0xb0f
>>>>>> head=0xb10
>>>>>> [  308.533857] ieee80211_sta_manage_reorder_buf: out of date seq=0xb14
>>>>>> head=0xb15
>>>>>> [  308.540480] ieee80211_sta_manage_reorder_buf: out of date seq=0xb19
>>>>>> head=0xb1a
>>>>>> [  308.547730] ieee80211_sta_manage_reorder_buf: out of date seq=0xb1e
>>>>>> head=0xb1f
>>>>>> [  308.554069] ieee80211_sta_manage_reorder_buf: out of date seq=0xb23
>>>>>> head=0xb24
>>>>>>
>>>>>>
>>>>>> On Wed, Jul 2, 2014 at 9:49 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
>>>>>>> On 30 June 2014 22:15, Denton Gentry <denton.gentry@gmail.com> wrote:
>>>>>>>> In iperf tests using a MacBook STA bridging through an ath10k AP to an
>>>>>>>> Ethernet server, I'm noticing very selective packet loss. The second
>>>>>>>> and subsequent frames in an A-MSDU packet appear to be dropped.
>>>>>>>>
>>>>>>>> The AP sets the A-MSDU size to 3839 bytes, and the MacBook frequently
>>>>>>>> sends A-MSDU packets containing two TCP frames. So far as I can tell,
>>>>>>>> the first TCP frame from an A-MSDU aggregate is delivered and the
>>>>>>>> second is consistently lost. The MacBook generally retransmits the
>>>>>>>> lost frame as a singleton with no aggregation, and the retransmitted
>>>>>>>> frame makes it through.
>>>>>>>>
>>>>>>>> This became more noticeable after the reordering fixes in
>>>>>>>> http://lists.infradead.org/pipermail/ath10k/2014-June/002552.html
>>>>>>>>
>>>>>>>> I see this A-MSDU packet loss behavior both with and without the
>>>>>>>> reordering fixes, the first packet in an A-MSDU is delivered while the
>>>>>>>> second is dropped. However, *without* the reordering fixes (and
>>>>>>>> therefore with packets delivered out of order) the MacBook sends
>>>>>>>> relatively few A-MSDU frames. *With* the reordering fixes, so all
>>>>>>>> packets are delivered in order, the MacBook keeps sending A-MSDU and
>>>>>>>> therefore has to deal with more packet loss. I suspect it is an
>>>>>>>> interaction with the MacOS TCP congestion window which I'm likely
>>>>>>>> never going to fully understand, its stuck in a region of the
>>>>>>>> congestion window where the Wifi driver keeps choosing to using
>>>>>>>> A-MSDU.
>>>>>>>
>>>>>>> I was actually worried about A-MSDU once A-MPDU re-ordering issue was raised.
>>>>>>>
>>>>>>> ath10k fw reports A-MSDU subframes separately. To avoid memory
>>>>>>> copying/allocation overhead each subframe is reported as a singly
>>>>>>> A-MSDU MSDU to mac80211 with an extra rx_flag AMSDU_MORE. Perhaps
>>>>>>> A-MPDU reordering intereferes with A-MSDU now?
>>>>>>>
>>> Denton could you try attached patch: report amsdu in one big frame.
>>> If help, we can add amsdu skb list support to mac80211/cfg80211 - to
>>> improve performance and reduce memcpy, while currently we have skb
>>> frames, put them in one big skb and next cfg80211 split them again
>>> into msdus and report to stack.
>>>
>>> BR
>>> Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
