Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oa0-x231.google.com ([2607:f8b0:4003:c02::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X4l4J-0003d8-3a
 for ath10k@lists.infradead.org; Wed, 09 Jul 2014 06:09:36 +0000
Received: by mail-oa0-f49.google.com with SMTP id i7so7542157oag.22
 for <ath10k@lists.infradead.org>; Tue, 08 Jul 2014 23:09:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALhHN=pvh8qocDzoMvK--__hJD1PVe5CrPBVriC1w=Bx1cpxpg@mail.gmail.com>
References: <CABnBrYU3P5qXd7pE7LJ_K4JeNFLtbZnpsTgvqtpdMs07qz_gGA@mail.gmail.com>
 <CA+BoTQk_YtrHrR6Wi3mMAZxT6EHFBxdUAafp48GqfUcM=HwfZg@mail.gmail.com>
 <CABnBrYXn0T=bW45zR5VivFRhP4BqFswYY93hrjB7rx+azKX9uA@mail.gmail.com>
 <CABnBrYUTKdvUiDha3meiiu08BCqNVBuCgXb7M_Gr4DwhyON3qw@mail.gmail.com>
 <CAJ-Vmo=JKpnoU2p4swTiXeTM0Q2LYWo7-VW_-vnOLb4ufVSO5A@mail.gmail.com>
 <CALhHN=r9_3i3R45Exs59d02XRTa-07WWvBwmGY9pEKufZb3Byw@mail.gmail.com>
 <CABnBrYVANG1cwC8ixD0hGY5guaB3XTP=PAxsf4OfVuZw+iLMaA@mail.gmail.com>
 <CABnBrYUz7Wp0aKkBX8JVFUjOdoZV6gss3x2yMRVwO9WhuH26+Q@mail.gmail.com>
 <CALhHN=rHKJS_FHG1yLhdR_JiUG6_T_q8u3RT1vgtzCdJVXbARQ@mail.gmail.com>
 <CALhHN=pUG+wvvgLe+8mxJ8obE-uBGAk8WEbh0HoGpUrzxi_MpQ@mail.gmail.com>
 <CALhHN=pvh8qocDzoMvK--__hJD1PVe5CrPBVriC1w=Bx1cpxpg@mail.gmail.com>
Date: Tue, 8 Jul 2014 23:09:05 -0700
Message-ID: <CABnBrYVY_KY8mMAKhy-DV1s3+vut8oR_LohyBJX3GtW7RT=3XA@mail.gmail.com>
Subject: Re: A-MSDU reception not working?
From: Denton Gentry <denton.gentry@gmail.com>
Content-Type: multipart/mixed; boundary=001a1135eef0a6fea104fdbc8bfa
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, Michal Kazior <michal.kazior@tieto.com>

--001a1135eef0a6fea104fdbc8bfa
Content-Type: text/plain; charset=UTF-8

I ran iperf on an 802.11ac MacBook Air, through my ath10 AP, and to an
Ubuntu system connected to the AP via Ethernet. The AP was running the
reorder buffer patches, the patch to make A-MSDU bypass the reorder
buffer, and the patch to make amsdu aggregation configurable via
debugfs.

http://lists.infradead.org/pipermail/ath10k/2014-June/002551.html
http://lists.infradead.org/pipermail/ath10k/2014-June/002553.html
http://lists.infradead.org/pipermail/ath10k/2014-July/002597.html
http://permalink.gmane.org/gmane.linux.kernel.wireless.general/124128

It was notably not running the patch from earlier in this thread to
copy A-MSDU subframes into one skb.


I used a second ath10k AP configured in monitor mode as a Wifi
sniffer. I also gathered pcaps on the MacBook Air and on the Ubuntu
system. Wireshark on the MacBook cannot gather radiotap headers nor
put the interface into monitor mode, so we see only Ethernet frames
and we don't see retransmissions on the Wifi link.

I've attached decodes of the same two packets as captured by the
MacBook, by the sniffer, and by the Ubuntu server.

The MacBook sends two frames, TCP sequence numbers 3065441 and 3066889
(the Wireshark "relative sequence number"). In the Wifi sniffer we see
these being aggregated as two subframes in an A-MSDU frame. The first
time this A-MSDU is sent it is corrupted in the air. We see the TCP
checksum of one of the subframes is wrong, and a few bytes of the
payload replaced with "&gt%'g9(1$".

The A-MSDU is retransmitted a short time later, and the second time
the TCP checksum of both subframes is correct.

This is all fine so far.

However in the pcap taken from the Ubuntu server, we see TCP sequence
number 3065441 being delivered *twice.* The first time, the TCP
checksum is wrong. The second time the TCP checksum is correct.

To me, it looks like A-MSDU frames with bad FCS are not being
discarded after ieee80211_rx_monitor(). The corrupted frames are being
delivered. Delivering the corrupted frames results in sending more TCP
Dup ACKs for the same sequence number back to the MacBook, and I think
this is what causes the MacBook to decide there is congestion and slow
down.

One note: the wifi sniffer does not show the same corruption to the
same packet as the pcap from the Ubuntu system shows. I think that is
normal: the sniffer won't see precisely the same noise, won't have
precisely the same receive sensitivity, and its antennas are not
pointing in the same direction as the primary AP. If I do this test
again, I'll gather a pcap on the primary AP as well to compare to what
we see on the Ubuntu system.


On Tue, Jul 8, 2014 at 12:29 AM, Janusz Dziedzic
<janusz.dziedzic@tieto.com> wrote:
> On 8 July 2014 09:02, Janusz Dziedzic <janusz.dziedzic@tieto.com> wrote:
>> On 8 July 2014 08:50, Janusz Dziedzic <janusz.dziedzic@tieto.com> wrote:
>>> On 8 July 2014 08:43, Denton Gentry <denton.gentry@gmail.com> wrote:
>>>> I think I know what is happening now, though I've no idea why. The
>>>> throughput is low because we have many TCP retransmissions. We have
>>>> retransmissions because the TCP checksum is wrong on a number of
>>>> frames, and I do find data corruption in the payload so the checksum
>>>> definitely should be wrong. All of the corrupted frames were
>>>> originally one of the subframes in an A-MSDU packet.
>>>>
>>>> An example follows at the end of this message, as dissected by
>>>> Wireshark. iperf sends a very regular data pattern of "0123456789..."
>>>> over and over. Note how in subframe #2 offset 0x1e0 the bytes "32 33
>>>> 34" have been replaced by "72 36 35"
>>>>
>>>> 01e0  32 33 34 35 36 37 38 39 30 31 72 36 35 35 36 37   2345678901r65567
>>>>
>>>> I added printks at the bottom of ath10k_htt_rx_amsdu immediately
>>>> before the call to ath10k_process_rx. I found this same packet, and we
>>>> see the "72 36 35" corruption in the printk. So I think it happened in
>>>> ath10k_process_rx or before, not anything weird after passing it up to
>>>> mac80211.
>>>>
>>>> [  101.863712] ath10k: 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39 30
>>>> [  101.863727] ath10k: 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35 36
>>>> [  101.863742] ath10k: 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31 32
>>>> [  101.863757] ath10k: 33 34 35 36 37 38 39 30 31 72 36 35 35 36 37 38
>>>> [  101.863773] ath10k: 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33 34
>>>> [  101.863788] ath10k: 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39 30
>>>> [  101.863803] ath10k: 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35 36
>>>>
>>>>
>>>> I've found a number of examples of similar corruption, always with
>>>> between one and four bytes replaced.
>>>>
>>>> 35363738 -> e52c6e07
>>>> 3435 -> b43f
>>>> 3839 -> c238
>>>> 31 -> 7f
>>>> 3435 -> 7436
>>>> 30 -> 50
>>>> 3233 -> bc37
>>>>
>>> Seems this could be because of:
>>>
>>> + /* cfg80211 expect this padding */
>>> + padding = (4 - (skb->len + sizeof(subframe_hdr))) & 0x3;
>>> + skb_put(skb, padding);
>>>
>>
>> BTW, when AP (ath10k) send TCP ACK - are this packets also AMSDU?
>> I see in my case AP can send 3 x A-MSDU (with total size 304 bytes)
>> small frames aggregated. Maybe your HW have problems with that.
>> As I remember correctly someone some time ago report problems with
>> MacBook pro retina but I am not sure this is the same, while no one
>> tests the fix.
>>
>>>>
>>>> The packet described above, dissected by Wireshark:
>>>>
>>>> No.     Time        Source                Destination
>>>> Protocol Length Info
>>>>    2235 18.953349   192.168.144.79        192.168.144.13        TCP
>>>>   3112   52697 > 5001 [ACK] Seq=1391553 Ack=1 Win=131760 [TCP CHECKSUM
>>>> INCORRECT] Len=1448 TSval=1298580657 TSecr=4294947481
>>>>
>>>> Frame 2235: 3112 bytes on wire (24896 bits), 3112 bytes captured (24896 bits)
>>>>     Encapsulation type: IEEE 802.11 plus radiotap radio header (23)
>>>>     Arrival Time: Jul  7, 2014 23:03:37.763365000 PDT
>>>>     [Time shift for this packet: 0.000000000 seconds]
>>>>     Epoch Time: 1404799417.763365000 seconds
>>>>     [Time delta from previous captured frame: 0.003476000 seconds]
>>>>     [Time delta from previous displayed frame: 0.515641000 seconds]
>>>>     [Time since reference or first frame: 18.953349000 seconds]
>>>>     Frame Number: 2235
>>>>     Frame Length: 3112 bytes (24896 bits)
>>>>     Capture Length: 3112 bytes (24896 bits)
>>>>     [Frame is marked: False]
>>>>     [Frame is ignored: False]
>>>>     [Protocols in frame: radiotap:wlan:llc:ip:tcp:data:llc:ip:tcp:data]
>>>>     [Coloring Rule Name: TCP]
>>>>     [Coloring Rule String: tcp]
>>>> Radiotap Header v0, Length 38
>>>>     Header revision: 0
>>>>     Header pad: 0
>>>>     Header length: 38
>>>>     Present flags
>>>>         .... .... .... .... .... .... .... ...1 = TSFT: True
>>>>         .... .... .... .... .... .... .... ..1. = Flags: True
>>>>         .... .... .... .... .... .... .... .0.. = Rate: False
>>>>         .... .... .... .... .... .... .... 1... = Channel: True
>>>>         .... .... .... .... .... .... ...0 .... = FHSS: False
>>>>         .... .... .... .... .... .... ..1. .... = dBm Antenna Signal: True
>>>>         .... .... .... .... .... .... .0.. .... = dBm Antenna Noise: False
>>>>         .... .... .... .... .... .... 0... .... = Lock Quality: False
>>>>         .... .... .... .... .... ...0 .... .... = TX Attenuation: False
>>>>         .... .... .... .... .... ..0. .... .... = dB TX Attenuation: False
>>>>         .... .... .... .... .... .0.. .... .... = dBm TX Power: False
>>>>         .... .... .... .... .... 1... .... .... = Antenna: True
>>>>         .... .... .... .... ...0 .... .... .... = dB Antenna Signal: False
>>>>         .... .... .... .... ..0. .... .... .... = dB Antenna Noise: False
>>>>         .... .... .... .... .1.. .... .... .... = RX flags: True
>>>>         .... .... .... .0.. .... .... .... .... = Channel+: False
>>>>         .... .... .... 0... .... .... .... .... = HT information: False
>>>>         .... .... ...0 .... .... .... .... .... = A-MPDU Status: False
>>>>         .... .... ..1. .... .... .... .... .... = VHT information: True
>>>>         ...0 0000 00.. .... .... .... .... .... = Reserved: 0x00000000
>>>>         ..0. .... .... .... .... .... .... .... = Radiotap NS next: False
>>>>         .0.. .... .... .... .... .... .... .... = Vendor NS next: False
>>>>         0... .... .... .... .... .... .... .... = Ext: False
>>>>     MAC timestamp: 78051063
>>>>     Flags: 0x00
>>>>         .... ...0 = CFP: False
>>>>         .... ..0. = Preamble: Long
>>>>         .... .0.. = WEP: False
>>>>         .... 0... = Fragmentation: False
>>>>         ...0 .... = FCS at end: False
>>>>         ..0. .... = Data Pad: False
>>>>         .0.. .... = Bad FCS: False
>>>>         0... .... = Short GI: False
>>>>     Channel frequency: 5745 [A 149]
>>>>     Channel type: 802.11a (0x0140)
>>>>         .... .... ...0 .... = Turbo: False
>>>>         .... .... ..0. .... = Complementary Code Keying (CCK): False
>>>>         .... .... .1.. .... = Orthogonal Frequency-Division
>>>> Multiplexing (OFDM): True
>>>>         .... .... 0... .... = 2 GHz spectrum: False
>>>>         .... ...1 .... .... = 5 GHz spectrum: True
>>>>         .... ..0. .... .... = Passive: False
>>>>         .... .0.. .... .... = Dynamic CCK-OFDM: False
>>>>         .... 0... .... .... = Gaussian Frequency Shift Keying (GFSK): False
>>>>         ...0 .... .... .... = GSM (900MHz): False
>>>>         ..0. .... .... .... = Static Turbo: False
>>>>         .0.. .... .... .... = Half Rate Channel (10MHz Channel Width): False
>>>>         0... .... .... .... = Quarter Rate Channel (5MHz Channel Width): False
>>>>     SSI Signal: -53 dBm
>>>>     Antenna: 0
>>>>     RX flags: 0x0000
>>>>         .... .... .... .... .... ..0. = Bad PLCP: False
>>>>     VHT information
>>>>         Known VHT information: 0x44
>>>>             .... .... .... ...0 = STBC: False
>>>>             .... .... .... ..0. = TXOP_PS_NOT_ALLOWED: False
>>>>             .... .... .... .1.. = Guard interval: True
>>>>             .... .... .... 0... = SGI Nsym disambiguation: False
>>>>             .... .... ...0 .... = LDPC extra OFDM symbol: False
>>>>             .... .... ..0. .... = Beamformed: False
>>>>             .... .... .1.. .... = Bandwidth: True
>>>>             .... .... 0... .... = Group ID: False
>>>>             .... ...0 .... .... = Partial AID: False
>>>>         .... .0.. = Guard interval: long (0)
>>>>         Bandwidth: 80 MHz (4)
>>>>         User 0: MCS 8
>>>>             1000 .... = MCS index 0: 8 (256-QAM 3/4)
>>>>             .... 0010 = Spatial streams 0: 2
>>>>             Space-time streams 0: 2
>>>>             Coding 0: BCC (0)
>>>>             [Data Rate: 702.0 Mb/s]
>>>> IEEE 802.11 QoS Data, Flags: .......T
>>>>     Type/Subtype: QoS Data (0x28)
>>>>     Frame Control Field: 0x8801
>>>>         .... ..00 = Version: 0
>>>>         .... 10.. = Type: Data frame (2)
>>>>         1000 .... = Subtype: 8
>>>>         Flags: 0x01
>>>>             .... ..01 = DS status: Frame from STA to DS via an AP (To
>>>> DS: 1 From DS: 0) (0x01)
>>>>             .... .0.. = More Fragments: This is the last fragment
>>>>             .... 0... = Retry: Frame is not being retransmitted
>>>>             ...0 .... = PWR MGT: STA will stay up
>>>>             ..0. .... = More Data: No data buffered
>>>>             .0.. .... = Protected flag: Data is not protected
>>>>             0... .... = Order flag: Not strictly ordered
>>>>     .000 0000 0011 0000 = Duration: 48 microseconds
>>>>     Receiver address: SenaoNet_18:a8:00 (88:dc:96:18:a8:00)
>>>>     BSS Id: SenaoNet_18:a8:00 (88:dc:96:18:a8:00)
>>>>     Transmitter address: Apple_67:24:54 (84:38:35:67:24:54)
>>>>     Source address: Apple_67:24:54 (84:38:35:67:24:54)
>>>>     Destination address: SenaoNet_18:a8:00 (88:dc:96:18:a8:00)
>>>>     Fragment number: 0
>>>>     Sequence number: 1021
>>>>     Qos Control: 0x0080
>>>>         .... .... .... 0000 = TID: 0
>>>>         [.... .... .... .000 = Priority: Best Effort (Best Effort) (0)]
>>>>         .... .... ...0 .... = QoS bit 4: Bits 8-15 of QoS Control
>>>> field are TXOP Duration Requested
>>>>         .... .... .00. .... = Ack Policy: Normal Ack (0x0000)
>>>>         .... .... 1... .... = Payload Type: A-MSDU
>>>>         0000 0000 .... .... = TXOP Duration Requested: 0 (no TXOP requested)
>>>> IEEE 802.11 Aggregate MSDU
>>>>     A-MSDU Subframe #1
>>>>         Destination address: GoogleFi_00:14:cd (f8:8f:ca:00:14:cd)
>>>>         Source address: Apple_67:24:54 (84:38:35:67:24:54)
>>>>         A-MSDU Length: 1510
>>>>         Logical-Link Control
>>>>             DSAP: SNAP (0xaa)
>>>>             IG Bit: Individual
>>>>             SSAP: SNAP (0xaa)
>>>>             CR Bit: Command
>>>>             Control field: U, func=UI (0x03)
>>>>                 000. 00.. = Command: Unnumbered Information (0x00)
>>>>                 .... ..11 = Frame type: Unnumbered frame (0x03)
>>>>             Organization Code: Encapsulated Ethernet (0x000000)
>>>>             Type: IP (0x0800)
>>>>         Internet Protocol Version 4, Src: 192.168.144.79
>>>> (192.168.144.79), Dst: 192.168.144.13 (192.168.144.13)
>>>>             Version: 4
>>>>             Header length: 20 bytes
>>>>             Differentiated Services Field: 0x00 (DSCP 0x00: Default;
>>>> ECN: 0x00: Not-ECT (Not ECN-Capable Transport))
>>>>                 0000 00.. = Differentiated Services Codepoint: Default (0x00)
>>>>                 .... ..00 = Explicit Congestion Notification: Not-ECT
>>>> (Not ECN-Capable Transport) (0x00)
>>>>             Total Length: 1500
>>>>             Identification: 0xc622 (50722)
>>>>             Flags: 0x00
>>>>                 0... .... = Reserved bit: Not set
>>>>                 .0.. .... = Don't fragment: Not set
>>>>                 ..0. .... = More fragments: Not set
>>>>             Fragment offset: 0
>>>>             Time to live: 64
>>>>             Protocol: TCP (6)
>>>>             Header checksum: 0x0d4c [correct]
>>>>                 [Good: True]
>>>>                 [Bad: False]
>>>>             Source: 192.168.144.79 (192.168.144.79)
>>>>             Destination: 192.168.144.13 (192.168.144.13)
>>>>             [Source GeoIP: Unknown]
>>>>             [Destination GeoIP: Unknown]
>>>>         Transmission Control Protocol, Src Port: 52697 (52697), Dst
>>>> Port: 5001 (5001), Seq: 1390105, Ack: 1, Len: 1448
>>>>             Source port: 52697 (52697)
>>>>             Destination port: 5001 (5001)
>>>>             [Stream index: 0]
>>>>             Sequence number: 1390105    (relative sequence number)
>>>>             [Next sequence number: 1391553    (relative sequence number)]
>>>>             Acknowledgment number: 1    (relative ack number)
>>>>             Header length: 32 bytes
>>>>             Flags: 0x010 (ACK)
>>>>                 000. .... .... = Reserved: Not set
>>>>                 ...0 .... .... = Nonce: Not set
>>>>                 .... 0... .... = Congestion Window Reduced (CWR): Not set
>>>>                 .... .0.. .... = ECN-Echo: Not set
>>>>                 .... ..0. .... = Urgent: Not set
>>>>                 .... ...1 .... = Acknowledgment: Set
>>>>                 .... .... 0... = Push: Not set
>>>>                 .... .... .0.. = Reset: Not set
>>>>                 .... .... ..0. = Syn: Not set
>>>>                 .... .... ...0 = Fin: Not set
>>>>             Window size value: 8235
>>>>             [Calculated window size: 131760]
>>>>             [Window size scaling factor: 16]
>>>>             Checksum: 0xa1c0 [correct]
>>>>                 [Good Checksum: True]
>>>>                 [Bad Checksum: False]
>>>>             Options: (12 bytes), No-Operation (NOP), No-Operation
>>>> (NOP), Timestamps
>>>>                 No-Operation (NOP)
>>>>                     Type: 1
>>>>                         0... .... = Copy on fragmentation: No
>>>>                         .00. .... = Class: Control (0)
>>>>                         ...0 0001 = Number: No-Operation (NOP) (1)
>>>>                 No-Operation (NOP)
>>>>                     Type: 1
>>>>                         0... .... = Copy on fragmentation: No
>>>>                         .00. .... = Class: Control (0)
>>>>                         ...0 0001 = Number: No-Operation (NOP) (1)
>>>>                 Timestamps: TSval 1298580657, TSecr 4294947481
>>>>                     Kind: Timestamp (8)
>>>>                     Length: 10
>>>>                     Timestamp value: 1298580657
>>>>                     Timestamp echo reply: 4294947481
>>>>         Data (1448 bytes)
>>>>
>>>> 0000  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 0010  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 0020  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 0030  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 0040  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 0050  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 0060  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 0070  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 0080  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 0090  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 00a0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 00b0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 00c0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 00d0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 00e0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 00f0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 0100  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 0110  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 0120  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 0130  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 0140  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 0150  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 0160  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 0170  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 0180  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 0190  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 01a0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 01b0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 01c0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 01d0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 01e0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 01f0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 0200  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 0210  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 0220  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 0230  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 0240  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 0250  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 0260  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 0270  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 0280  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 0290  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 02a0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 02b0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 02c0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 02d0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 02e0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 02f0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 0300  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 0310  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 0320  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 0330  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 0340  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 0350  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 0360  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 0370  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 0380  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 0390  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 03a0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 03b0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 03c0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 03d0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 03e0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 03f0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 0400  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 0410  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 0420  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 0430  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 0440  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 0450  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 0460  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 0470  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 0480  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 0490  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 04a0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 04b0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 04c0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 04d0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 04e0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 04f0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 0500  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 0510  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 0520  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 0530  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 0540  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 0550  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 0560  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 0570  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 0580  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 0590  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 05a0  34 35 36 37 38 39 30 31                           45678901
>>>>             Data: 343536373839303132333435363738393031323334353637...
>>>>             [Length: 1448]
>>>>     A-MSDU Subframe #2
>>>>         Destination address: GoogleFi_00:14:cd (f8:8f:ca:00:14:cd)
>>>>         Source address: Apple_67:24:54 (84:38:35:67:24:54)
>>>>         A-MSDU Length: 1510
>>>>         Logical-Link Control
>>>>             DSAP: SNAP (0xaa)
>>>>             IG Bit: Individual
>>>>             SSAP: SNAP (0xaa)
>>>>             CR Bit: Command
>>>>             Control field: U, func=UI (0x03)
>>>>                 000. 00.. = Command: Unnumbered Information (0x00)
>>>>                 .... ..11 = Frame type: Unnumbered frame (0x03)
>>>>             Organization Code: Encapsulated Ethernet (0x000000)
>>>>             Type: IP (0x0800)
>>>>         Internet Protocol Version 4, Src: 192.168.144.79
>>>> (192.168.144.79), Dst: 192.168.144.13 (192.168.144.13)
>>>>             Version: 4
>>>>             Header length: 20 bytes
>>>>             Differentiated Services Field: 0x00 (DSCP 0x00: Default;
>>>> ECN: 0x00: Not-ECT (Not ECN-Capable Transport))
>>>>                 0000 00.. = Differentiated Services Codepoint: Default (0x00)
>>>>                 .... ..00 = Explicit Congestion Notification: Not-ECT
>>>> (Not ECN-Capable Transport) (0x00)
>>>>             Total Length: 1500
>>>>             Identification: 0xda09 (55817)
>>>>             Flags: 0x00
>>>>                 0... .... = Reserved bit: Not set
>>>>                 .0.. .... = Don't fragment: Not set
>>>>                 ..0. .... = More fragments: Not set
>>>>             Fragment offset: 0
>>>>             Time to live: 64
>>>>             Protocol: TCP (6)
>>>>             Header checksum: 0xf964 [correct]
>>>>                 [Good: True]
>>>>                 [Bad: False]
>>>>             Source: 192.168.144.79 (192.168.144.79)
>>>>             Destination: 192.168.144.13 (192.168.144.13)
>>>>             [Source GeoIP: Unknown]
>>>>             [Destination GeoIP: Unknown]
>>>>         Transmission Control Protocol, Src Port: 52697 (52697), Dst
>>>> Port: 5001 (5001), Seq: 1391553, Ack: 1, Len: 1448
>>>>             Source port: 52697 (52697)
>>>>             Destination port: 5001 (5001)
>>>>             [Stream index: 0]
>>>>             Sequence number: 1391553    (relative sequence number)
>>>>             [Next sequence number: 1393001    (relative sequence number)]
>>>>             Acknowledgment number: 1    (relative ack number)
>>>>             Header length: 32 bytes
>>>>             Flags: 0x010 (ACK)
>>>>                 000. .... .... = Reserved: Not set
>>>>                 ...0 .... .... = Nonce: Not set
>>>>                 .... 0... .... = Congestion Window Reduced (CWR): Not set
>>>>                 .... .0.. .... = ECN-Echo: Not set
>>>>                 .... ..0. .... = Urgent: Not set
>>>>                 .... ...1 .... = Acknowledgment: Set
>>>>                 .... .... 0... = Push: Not set
>>>>                 .... .... .0.. = Reset: Not set
>>>>                 .... .... ..0. = Syn: Not set
>>>>                 .... .... ...0 = Fin: Not set
>>>>             Window size value: 8235
>>>>             [Calculated window size: 131760]
>>>>             [Window size scaling factor: 16]
>>>>             Checksum: 0x9a16 [incorrect, should be 0x5913 (maybe
>>>> caused by "TCP checksum offload"?)]
>
> And yes we are using checksum offload in ath10k.
> Best is using standalone 80211ac sniffer for that case to be sure
> about checksum.
>
>>>>                 [Good Checksum: False]
>>>>                 [Bad Checksum: True]
>>>>                     [Expert Info (Error/Checksum): Bad checksum]
>>>>                         [Message: Bad checksum]
>>>>                         [Severity level: Error]
>>>>                         [Group: Checksum]
>>>>             Options: (12 bytes), No-Operation (NOP), No-Operation
>>>> (NOP), Timestamps
>>>>                 No-Operation (NOP)
>>>>                     Type: 1
>>>>                         0... .... = Copy on fragmentation: No
>>>>                         .00. .... = Class: Control (0)
>>>>                         ...0 0001 = Number: No-Operation (NOP) (1)
>>>>                 No-Operation (NOP)
>>>>                     Type: 1
>>>>                         0... .... = Copy on fragmentation: No
>>>>                         .00. .... = Class: Control (0)
>>>>                         ...0 0001 = Number: No-Operation (NOP) (1)
>>>>                 Timestamps: TSval 1298580657, TSecr 4294947481
>>>>                     Kind: Timestamp (8)
>>>>                     Length: 10
>>>>                     Timestamp value: 1298580657
>>>>                     Timestamp echo reply: 4294947481
>>>>         Data (1448 bytes)
>>>>
>>>> 0000  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 0010  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 0020  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 0030  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 0040  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 0050  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 0060  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 0070  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 0080  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 0090  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 00a0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 00b0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 00c0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 00d0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 00e0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 00f0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 0100  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 0110  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 0120  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 0130  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 0140  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 0150  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 0160  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 0170  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 0180  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 0190  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 01a0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 01b0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 01c0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 01d0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 01e0  32 33 34 35 36 37 38 39 30 31 72 36 35 35 36 37   2345678901r65567
>>>> 01f0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 0200  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 0210  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 0220  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 0230  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 0240  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 0250  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 0260  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 0270  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 0280  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 0290  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 02a0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 02b0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 02c0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 02d0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 02e0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 02f0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 0300  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 0310  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 0320  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 0330  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 0340  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 0350  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 0360  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 0370  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 0380  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 0390  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 03a0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 03b0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 03c0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 03d0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 03e0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 03f0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 0400  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 0410  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 0420  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 0430  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 0440  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 0450  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 0460  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 0470  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 0480  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 0490  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 04a0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 04b0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 04c0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 04d0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 04e0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 04f0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 0500  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 0510  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 0520  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 0530  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 0540  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 0550  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901234567
>>>> 0560  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567890123
>>>> 0570  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123456789
>>>> 0580  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789012345
>>>> 0590  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345678901
>>>> 05a0  32 33 34 35 36 37 38 39                           23456789
>>>>             Data: 323334353637383930313233343536373839303132333435...
>>>>             [Length: 1448]
>>>>
>>>> On Mon, Jul 7, 2014 at 12:26 PM, Denton Gentry <denton.gentry@gmail.com> wrote:
>>>>> The initial results are not promising: a MacOS 802.11ac client gets
>>>>> between 0-2 Mbps with this change, where it was getting about 8 Mbps
>>>>> prior to this change and ~170 Mbps prior to the reordering fix. A pcap
>>>>> from the receiving system shows a very large number of out of order
>>>>> frames, likely due to TCP retransmission.
>>>>>
>>>>> An 802.11n MacBook gets very good throughput, only the 802.11ac
>>>>> MacBook shows the very poor result. I'm trying to figure out why.
>>>>>
>>>>>
>>>>> One specific note (and probably not related to the throughput): I
>>>>> believe ath10k_htt_rx_amsdu runs in the tasklet, which means it would
>>>>> need to use GFP_ATOMIC instead of GFP_KERNEL. Do I understand it
>>>>> correctly?
>>>>>
>>>>>
>>>>> On Mon, Jul 7, 2014 at 1:30 AM, Janusz Dziedzic
>>>>> <janusz.dziedzic@tieto.com> wrote:
>>>>>> On 6 July 2014 04:27, Adrian Chadd <adrian@freebsd.org> wrote:
>>>>>>> I think you may have to tell mac80211 that it's okay and not to drop the frames.
>>>>>>>
>>>>>>> The earlier atheros chips would just give you the AMSDU frames as
>>>>>>> deaggregated A-MPDU sub-frames - you'd just pass the A-MSDU up to
>>>>>>> net80211 and it'd ull it apart. But if the driver is doing it (or,
>>>>>>> well, the chip is doing it) then mac80211 needs to know not to drop
>>>>>>> those sub-frames.
>>>>>>>
>>>>>>> I wonder if you'll ever get notified before the complete A-MPDU has
>>>>>>> been received. That happens on previous chips. eg, you have an A-MPDU
>>>>>>> of 16 frames with 4 MSDUs in each MPDU. If you get notified and handle
>>>>>>> half of one MPDU before you hit EOL, the next notification you process
>>>>>>> will be the next MSDU in the same MPDU - and then you'll hit the
>>>>>>> reordering hilarity again.
>>>>>>>
>>>>>>> So hm, i will face the same issue in FreeBSD at some point, so I'd
>>>>>>> likely do what you're thinking of doing - pass up a chain of mbufs
>>>>>>> representing the current MPDU and treat the whole lot as the frame(s)
>>>>>>> to care about. Honestly though, I'm kind of wondering whether I should
>>>>>>> mostly just do what the Atheros reference driver does and treat it as
>>>>>>> ethernet payload frames (ie, it's already de-encapsulated and the
>>>>>>> reordering is already done) and just tack on the wifi header bit via
>>>>>>> another of the DMA rings.
>>>>>>>
>>>>>>> Ugh, I really should sit down and write the FreeBSD version of this.
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> -a
>>>>>>>
>>>>>>> (I'm still having flashbacks from working on this firmware at QCA. Aiee.)
>>>>>>>
>>>>>>>
>>>>>>> On 5 July 2014 06:55, Denton Gentry <denton.gentry@gmail.com> wrote:
>>>>>>>> There are two issues in handling the dis-aggregated A-MSDU subframes
>>>>>>>> in ieee80211_sta_manage_reorder_buf:
>>>>>>>>
>>>>>>>> 1. The out-of-date check:
>>>>>>>>
>>>>>>>>         /* frame with out of date sequence number */
>>>>>>>>         if (ieee80211_sn_less(mpdu_seq_num, head_seq_num)) {
>>>>>>>>                 dev_kfree_skb(skb);
>>>>>>>>                 goto out;
>>>>>>>>         }
>>>>>>>>
>>>>>>>> As all of the subframes carry the same sequence number, the first
>>>>>>>> subframe will be delivered and increment head_seq_num and then all
>>>>>>>> subsequent subframes will be discarded.
>>>>>>>>
>>>>>>>>
>>>>>>>> 2. The duplicates check a bit later in the routine:
>>>>>>>>
>>>>>>>>         /* check if we already stored this frame */
>>>>>>>>         if (tid_agg_rx->reorder_buf[index]) {
>>>>>>>>                 dev_kfree_skb(skb);
>>>>>>>>                 goto out;
>>>>>>>>         }
>>>>>>>>
>>>>>>>> If there is enough packet loss that packets are queued in the reorder
>>>>>>>> buffer and not immediately released, then only the first subframe will
>>>>>>>> be stored. Subsequent subframes will be discarded as duplicates.
>>>>>>>>
>>>>>>>>
>>>>>>>> An 802.11ac MacBook is able to get about 170 Mbps with iperf prior to
>>>>>>>> the reordering buffer changes, and dropped to about 8 Mbps with the
>>>>>>>> reorder buffer. Hacking around the out-of-date sequence number check
>>>>>>>> to allow all subframes to egress restores it to 170 Mbps.
>>>>>>>>
>>>>>>>> In the area where I'm testing there isn't enough 5 GHz noise to make
>>>>>>>> the duplicates-check issue happen very often. By adding a printk I can
>>>>>>>> see that it does happen, but it doesn't impact the throughput and I
>>>>>>>> can't report the impact of fixing it.
>>>>>>>>
>>>>>>>> ----
>>>>>>>>
>>>>>>>> I do wonder if both of these are symptoms of dis-aggregating the
>>>>>>>> A-MSDU too early. mac80211 expects to be dealing with the whole MPDU
>>>>>>>> at a time, and the ath10k A-MSDU case is sending it subframes instead.
>>>>>>>> Trying to make the ath10k code send up all of the subframes as a chain
>>>>>>>> of skbs didn't immediately work, but I do wonder if that would better
>>>>>>>> match the mac80211 expectations.
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> On Fri, Jul 4, 2014 at 11:58 AM, Denton Gentry <denton.gentry@gmail.com> wrote:
>>>>>>>>> Yes, after some more testing it does look like an unfortunate
>>>>>>>>> interaction between the reorder buffer and A-MSDU. The disaggregated
>>>>>>>>> subframes all carry the same sequence number. The first subframe is
>>>>>>>>> released from the reorder buffer and increments the head_seq_num.
>>>>>>>>> Subsequent subframes are all discarded as being out of date.
>>>>>>>>>
>>>>>>>>> [  308.514021] ieee80211_sta_manage_reorder_buf: out of date seq=0xb05
>>>>>>>>> head=0xb06
>>>>>>>>> [  308.520577] ieee80211_sta_manage_reorder_buf: out of date seq=0xb0a
>>>>>>>>> head=0xb0b
>>>>>>>>> [  308.527198] ieee80211_sta_manage_reorder_buf: out of date seq=0xb0f
>>>>>>>>> head=0xb10
>>>>>>>>> [  308.533857] ieee80211_sta_manage_reorder_buf: out of date seq=0xb14
>>>>>>>>> head=0xb15
>>>>>>>>> [  308.540480] ieee80211_sta_manage_reorder_buf: out of date seq=0xb19
>>>>>>>>> head=0xb1a
>>>>>>>>> [  308.547730] ieee80211_sta_manage_reorder_buf: out of date seq=0xb1e
>>>>>>>>> head=0xb1f
>>>>>>>>> [  308.554069] ieee80211_sta_manage_reorder_buf: out of date seq=0xb23
>>>>>>>>> head=0xb24
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On Wed, Jul 2, 2014 at 9:49 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
>>>>>>>>>> On 30 June 2014 22:15, Denton Gentry <denton.gentry@gmail.com> wrote:
>>>>>>>>>>> In iperf tests using a MacBook STA bridging through an ath10k AP to an
>>>>>>>>>>> Ethernet server, I'm noticing very selective packet loss. The second
>>>>>>>>>>> and subsequent frames in an A-MSDU packet appear to be dropped.
>>>>>>>>>>>
>>>>>>>>>>> The AP sets the A-MSDU size to 3839 bytes, and the MacBook frequently
>>>>>>>>>>> sends A-MSDU packets containing two TCP frames. So far as I can tell,
>>>>>>>>>>> the first TCP frame from an A-MSDU aggregate is delivered and the
>>>>>>>>>>> second is consistently lost. The MacBook generally retransmits the
>>>>>>>>>>> lost frame as a singleton with no aggregation, and the retransmitted
>>>>>>>>>>> frame makes it through.
>>>>>>>>>>>
>>>>>>>>>>> This became more noticeable after the reordering fixes in
>>>>>>>>>>> http://lists.infradead.org/pipermail/ath10k/2014-June/002552.html
>>>>>>>>>>>
>>>>>>>>>>> I see this A-MSDU packet loss behavior both with and without the
>>>>>>>>>>> reordering fixes, the first packet in an A-MSDU is delivered while the
>>>>>>>>>>> second is dropped. However, *without* the reordering fixes (and
>>>>>>>>>>> therefore with packets delivered out of order) the MacBook sends
>>>>>>>>>>> relatively few A-MSDU frames. *With* the reordering fixes, so all
>>>>>>>>>>> packets are delivered in order, the MacBook keeps sending A-MSDU and
>>>>>>>>>>> therefore has to deal with more packet loss. I suspect it is an
>>>>>>>>>>> interaction with the MacOS TCP congestion window which I'm likely
>>>>>>>>>>> never going to fully understand, its stuck in a region of the
>>>>>>>>>>> congestion window where the Wifi driver keeps choosing to using
>>>>>>>>>>> A-MSDU.
>>>>>>>>>>
>>>>>>>>>> I was actually worried about A-MSDU once A-MPDU re-ordering issue was raised.
>>>>>>>>>>
>>>>>>>>>> ath10k fw reports A-MSDU subframes separately. To avoid memory
>>>>>>>>>> copying/allocation overhead each subframe is reported as a singly
>>>>>>>>>> A-MSDU MSDU to mac80211 with an extra rx_flag AMSDU_MORE. Perhaps
>>>>>>>>>> A-MPDU reordering intereferes with A-MSDU now?
>>>>>>>>>>
>>>>>> Denton could you try attached patch: report amsdu in one big frame.
>>>>>> If help, we can add amsdu skb list support to mac80211/cfg80211 - to
>>>>>> improve performance and reduce memcpy, while currently we have skb
>>>>>> frames, put them in one big skb and next cfg80211 split them again
>>>>>> into msdus and report to stack.
>>>>>>
>>>>>> BR
>>>>>> Janusz

--001a1135eef0a6fea104fdbc8bfa
Content-Type: text/plain; charset=US-ASCII; name="macbook.txt"
Content-Disposition: attachment; filename="macbook.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hxe8u5tt0

Tm8uICAgICBUaW1lICAgICAgICAgICBTb3VyY2UgICAgICAgICAgICAgICAgRGVzdGluYXRpb24g
ICAgICAgICAgIFByb3RvY29sIExlbmd0aCBJbmZvCiAgIDM3OTMgNS43ODQ4NjUwMDAgICAgMTky
LjE2OC4yNTQuNTIgICAgICAgIDE5Mi4xNjguMjU0LjEgICAgICAgICBUQ1AgICAgICAxNTE0ICAg
NTI3MzQgPiA1MDAxIFtBQ0tdIFNlcT0zMDY1NDQxIEFjaz0xIFdpbj0xMzE3NjAgTGVuPTE0NDgg
VFN2YWw9MTMwMjUxNDAxMSBUU2Vjcj0zMjg3NDY1ODIKCkZyYW1lIDM3OTM6IDE1MTQgYnl0ZXMg
b24gd2lyZSAoMTIxMTIgYml0cyksIDE1MTQgYnl0ZXMgY2FwdHVyZWQgKDEyMTEyIGJpdHMpIG9u
IGludGVyZmFjZSAwCiAgICBJbnRlcmZhY2UgaWQ6IDAKICAgIEVuY2Fwc3VsYXRpb24gdHlwZTog
RXRoZXJuZXQgKDEpCiAgICBBcnJpdmFsIFRpbWU6IEp1bCAgOCwgMjAxNCAxMToyNDozOC4xNzE1
NTIwMDAgUERUCiAgICBbVGltZSBzaGlmdCBmb3IgdGhpcyBwYWNrZXQ6IDAuMDAwMDAwMDAwIHNl
Y29uZHNdCiAgICBFcG9jaCBUaW1lOiAxNDA0ODQzODc4LjE3MTU1MjAwMCBzZWNvbmRzCiAgICBb
VGltZSBkZWx0YSBmcm9tIHByZXZpb3VzIGNhcHR1cmVkIGZyYW1lOiAwLjAwMDAwMTAwMCBzZWNv
bmRzXQogICAgW1RpbWUgZGVsdGEgZnJvbSBwcmV2aW91cyBkaXNwbGF5ZWQgZnJhbWU6IDAuMDAw
MDAxMDAwIHNlY29uZHNdCiAgICBbVGltZSBzaW5jZSByZWZlcmVuY2Ugb3IgZmlyc3QgZnJhbWU6
IDUuNzg0ODY1MDAwIHNlY29uZHNdCiAgICBGcmFtZSBOdW1iZXI6IDM3OTMKICAgIEZyYW1lIExl
bmd0aDogMTUxNCBieXRlcyAoMTIxMTIgYml0cykKICAgIENhcHR1cmUgTGVuZ3RoOiAxNTE0IGJ5
dGVzICgxMjExMiBiaXRzKQogICAgW0ZyYW1lIGlzIG1hcmtlZDogVHJ1ZV0KICAgIFtGcmFtZSBp
cyBpZ25vcmVkOiBGYWxzZV0KICAgIFtQcm90b2NvbHMgaW4gZnJhbWU6IGV0aDppcDp0Y3A6ZGF0
YV0KICAgIFtDb2xvcmluZyBSdWxlIE5hbWU6IFRDUF0KICAgIFtDb2xvcmluZyBSdWxlIFN0cmlu
ZzogdGNwXQpFdGhlcm5ldCBJSSwgU3JjOiBBcHBsZV82NzoyNDo1NCAoODQ6Mzg6MzU6Njc6MjQ6
NTQpLCBEc3Q6IEludGVsXzVlOmJkOjg1ICgwMDowZTowYzo1ZTpiZDo4NSkKICAgIERlc3RpbmF0
aW9uOiBJbnRlbF81ZTpiZDo4NSAoMDA6MGU6MGM6NWU6YmQ6ODUpCiAgICAgICAgQWRkcmVzczog
SW50ZWxfNWU6YmQ6ODUgKDAwOjBlOjBjOjVlOmJkOjg1KQogICAgICAgIC4uLi4gLi4wLiAuLi4u
IC4uLi4gLi4uLiAuLi4uID0gTEcgYml0OiBHbG9iYWxseSB1bmlxdWUgYWRkcmVzcyAoZmFjdG9y
eSBkZWZhdWx0KQogICAgICAgIC4uLi4gLi4uMCAuLi4uIC4uLi4gLi4uLiAuLi4uID0gSUcgYml0
OiBJbmRpdmlkdWFsIGFkZHJlc3MgKHVuaWNhc3QpCiAgICBTb3VyY2U6IEFwcGxlXzY3OjI0OjU0
ICg4NDozODozNTo2NzoyNDo1NCkKICAgICAgICBBZGRyZXNzOiBBcHBsZV82NzoyNDo1NCAoODQ6
Mzg6MzU6Njc6MjQ6NTQpCiAgICAgICAgLi4uLiAuLjAuIC4uLi4gLi4uLiAuLi4uIC4uLi4gPSBM
RyBiaXQ6IEdsb2JhbGx5IHVuaXF1ZSBhZGRyZXNzIChmYWN0b3J5IGRlZmF1bHQpCiAgICAgICAg
Li4uLiAuLi4wIC4uLi4gLi4uLiAuLi4uIC4uLi4gPSBJRyBiaXQ6IEluZGl2aWR1YWwgYWRkcmVz
cyAodW5pY2FzdCkKICAgIFR5cGU6IElQICgweDA4MDApCkludGVybmV0IFByb3RvY29sIFZlcnNp
b24gNCwgU3JjOiAxOTIuMTY4LjI1NC41MiAoMTkyLjE2OC4yNTQuNTIpLCBEc3Q6IDE5Mi4xNjgu
MjU0LjEgKDE5Mi4xNjguMjU0LjEpCiAgICBWZXJzaW9uOiA0CiAgICBIZWFkZXIgbGVuZ3RoOiAy
MCBieXRlcwogICAgRGlmZmVyZW50aWF0ZWQgU2VydmljZXMgRmllbGQ6IDB4MDAgKERTQ1AgMHgw
MDogRGVmYXVsdDsgRUNOOiAweDAwOiBOb3QtRUNUIChOb3QgRUNOLUNhcGFibGUgVHJhbnNwb3J0
KSkKICAgICAgICAwMDAwIDAwLi4gPSBEaWZmZXJlbnRpYXRlZCBTZXJ2aWNlcyBDb2RlcG9pbnQ6
IERlZmF1bHQgKDB4MDApCiAgICAgICAgLi4uLiAuLjAwID0gRXhwbGljaXQgQ29uZ2VzdGlvbiBO
b3RpZmljYXRpb246IE5vdC1FQ1QgKE5vdCBFQ04tQ2FwYWJsZSBUcmFuc3BvcnQpICgweDAwKQog
ICAgVG90YWwgTGVuZ3RoOiAxNTAwCiAgICBJZGVudGlmaWNhdGlvbjogMHhhMDNkICg0MTAyMSkK
ICAgIEZsYWdzOiAweDAyIChEb24ndCBGcmFnbWVudCkKICAgICAgICAwLi4uIC4uLi4gPSBSZXNl
cnZlZCBiaXQ6IE5vdCBzZXQKICAgICAgICAuMS4uIC4uLi4gPSBEb24ndCBmcmFnbWVudDogU2V0
CiAgICAgICAgLi4wLiAuLi4uID0gTW9yZSBmcmFnbWVudHM6IE5vdCBzZXQKICAgIEZyYWdtZW50
IG9mZnNldDogMAogICAgVGltZSB0byBsaXZlOiA2NAogICAgUHJvdG9jb2w6IFRDUCAoNikKICAg
IEhlYWRlciBjaGVja3N1bTogMHgxNzU3IFtjb3JyZWN0XQogICAgICAgIFtHb29kOiBUcnVlXQog
ICAgICAgIFtCYWQ6IEZhbHNlXQogICAgU291cmNlOiAxOTIuMTY4LjI1NC41MiAoMTkyLjE2OC4y
NTQuNTIpCiAgICBEZXN0aW5hdGlvbjogMTkyLjE2OC4yNTQuMSAoMTkyLjE2OC4yNTQuMSkKICAg
IFtTb3VyY2UgR2VvSVA6IFVua25vd25dCiAgICBbRGVzdGluYXRpb24gR2VvSVA6IFVua25vd25d
ClRyYW5zbWlzc2lvbiBDb250cm9sIFByb3RvY29sLCBTcmMgUG9ydDogNTI3MzQgKDUyNzM0KSwg
RHN0IFBvcnQ6IDUwMDEgKDUwMDEpLCBTZXE6IDMwNjU0NDEsIEFjazogMSwgTGVuOiAxNDQ4CiAg
ICBTb3VyY2UgcG9ydDogNTI3MzQgKDUyNzM0KQogICAgRGVzdGluYXRpb24gcG9ydDogNTAwMSAo
NTAwMSkKICAgIFtTdHJlYW0gaW5kZXg6IDBdCiAgICBTZXF1ZW5jZSBudW1iZXI6IDMwNjU0NDEg
ICAgKHJlbGF0aXZlIHNlcXVlbmNlIG51bWJlcikKICAgIFtOZXh0IHNlcXVlbmNlIG51bWJlcjog
MzA2Njg4OSAgICAocmVsYXRpdmUgc2VxdWVuY2UgbnVtYmVyKV0KICAgIEFja25vd2xlZGdtZW50
IG51bWJlcjogMSAgICAocmVsYXRpdmUgYWNrIG51bWJlcikKICAgIEhlYWRlciBsZW5ndGg6IDMy
IGJ5dGVzCiAgICBGbGFnczogMHgwMTAgKEFDSykKICAgICAgICAwMDAuIC4uLi4gLi4uLiA9IFJl
c2VydmVkOiBOb3Qgc2V0CiAgICAgICAgLi4uMCAuLi4uIC4uLi4gPSBOb25jZTogTm90IHNldAog
ICAgICAgIC4uLi4gMC4uLiAuLi4uID0gQ29uZ2VzdGlvbiBXaW5kb3cgUmVkdWNlZCAoQ1dSKTog
Tm90IHNldAogICAgICAgIC4uLi4gLjAuLiAuLi4uID0gRUNOLUVjaG86IE5vdCBzZXQKICAgICAg
ICAuLi4uIC4uMC4gLi4uLiA9IFVyZ2VudDogTm90IHNldAogICAgICAgIC4uLi4gLi4uMSAuLi4u
ID0gQWNrbm93bGVkZ21lbnQ6IFNldAogICAgICAgIC4uLi4gLi4uLiAwLi4uID0gUHVzaDogTm90
IHNldAogICAgICAgIC4uLi4gLi4uLiAuMC4uID0gUmVzZXQ6IE5vdCBzZXQKICAgICAgICAuLi4u
IC4uLi4gLi4wLiA9IFN5bjogTm90IHNldAogICAgICAgIC4uLi4gLi4uLiAuLi4wID0gRmluOiBO
b3Qgc2V0CiAgICBXaW5kb3cgc2l6ZSB2YWx1ZTogODIzNQogICAgW0NhbGN1bGF0ZWQgd2luZG93
IHNpemU6IDEzMTc2MF0KICAgIFtXaW5kb3cgc2l6ZSBzY2FsaW5nIGZhY3RvcjogMTZdCiAgICBD
aGVja3N1bTogMHgxYjcyIFtjb3JyZWN0XQogICAgICAgIFtHb29kIENoZWNrc3VtOiBUcnVlXQog
ICAgICAgIFtCYWQgQ2hlY2tzdW06IEZhbHNlXQogICAgT3B0aW9uczogKDEyIGJ5dGVzKSwgTm8t
T3BlcmF0aW9uIChOT1ApLCBOby1PcGVyYXRpb24gKE5PUCksIFRpbWVzdGFtcHMKICAgICAgICBO
by1PcGVyYXRpb24gKE5PUCkKICAgICAgICAgICAgVHlwZTogMQogICAgICAgICAgICAgICAgMC4u
LiAuLi4uID0gQ29weSBvbiBmcmFnbWVudGF0aW9uOiBObwogICAgICAgICAgICAgICAgLjAwLiAu
Li4uID0gQ2xhc3M6IENvbnRyb2wgKDApCiAgICAgICAgICAgICAgICAuLi4wIDAwMDEgPSBOdW1i
ZXI6IE5vLU9wZXJhdGlvbiAoTk9QKSAoMSkKICAgICAgICBOby1PcGVyYXRpb24gKE5PUCkKICAg
ICAgICAgICAgVHlwZTogMQogICAgICAgICAgICAgICAgMC4uLiAuLi4uID0gQ29weSBvbiBmcmFn
bWVudGF0aW9uOiBObwogICAgICAgICAgICAgICAgLjAwLiAuLi4uID0gQ2xhc3M6IENvbnRyb2wg
KDApCiAgICAgICAgICAgICAgICAuLi4wIDAwMDEgPSBOdW1iZXI6IE5vLU9wZXJhdGlvbiAoTk9Q
KSAoMSkKICAgICAgICBUaW1lc3RhbXBzOiBUU3ZhbCAxMzAyNTE0MDExLCBUU2VjciAzMjg3NDY1
ODIKICAgICAgICAgICAgS2luZDogVGltZXN0YW1wICg4KQogICAgICAgICAgICBMZW5ndGg6IDEw
CiAgICAgICAgICAgIFRpbWVzdGFtcCB2YWx1ZTogMTMwMjUxNDAxMQogICAgICAgICAgICBUaW1l
c3RhbXAgZWNobyByZXBseTogMzI4NzQ2NTgyCiAgICBbU0VRL0FDSyBhbmFseXNpc10KICAgICAg
ICBbQnl0ZXMgaW4gZmxpZ2h0OiA1NzkyXQpEYXRhICgxNDQ4IGJ5dGVzKQoKMDAwMCAgMzAgMzEg
MzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEy
MzQ1CjAwMTAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMx
ICAgNjc4OTAxMjM0NTY3ODkwMQowMDIwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAz
MiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDAzMCAgMzggMzkgMzAgMzEgMzIg
MzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjAwNDAg
IDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5
MDEyMzQ1Njc4OQowMDUwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAz
MyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDA2MCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMg
MzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjAwNzAgIDMyIDMzIDM0
IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2
NwowMDgwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAg
IDg5MDEyMzQ1Njc4OTAxMjMKMDA5MCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQg
MzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjAwYTAgIDMwIDMxIDMyIDMzIDM0IDM1
IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowMGIwICAz
NiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIz
NDU2Nzg5MDEKMDBjMCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUg
MzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjAwZDAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2
IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowMGUwICAzNCAzNSAzNiAz
NyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkK
MDBmMCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAw
MTIzNDU2Nzg5MDEyMzQ1CjAxMDAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3
IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQowMTEwICAzMiAzMyAzNCAzNSAzNiAzNyAz
OCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDEyMCAgMzgg
MzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3
ODkwMTIzCjAxMzAgIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4
IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowMTQwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAz
OSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDE1MCAgMzYgMzcgMzggMzkg
MzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjAx
NjAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0
NTY3ODkwMTIzNDU2NwowMTcwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAz
MCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDE4MCAgMzQgMzUgMzYgMzcgMzggMzkgMzAg
MzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjAxOTAgIDMwIDMx
IDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAx
MjM0NQowMWEwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAz
MSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDFiMCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEg
MzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjAxYzAgIDM4IDM5IDMwIDMxIDMy
IDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowMWQw
ICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4
OTAxMjM0NTY3ODkKMDFlMCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIg
MzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjAxZjAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMz
IDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQowMjAwICAzMiAzMyAz
NCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1
NjcKMDIxMCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMg
ICA4OTAxMjM0NTY3ODkwMTIzCjAyMjAgIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0
IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowMjMwICAzMCAzMSAzMiAzMyAzNCAz
NSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDI0MCAg
MzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEy
MzQ1Njc4OTAxCjAyNTAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1
IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowMjYwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAz
NiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDI3MCAgMzQgMzUgMzYg
MzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5
CjAyODAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAg
MDEyMzQ1Njc4OTAxMjM0NQowMjkwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAz
NyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDJhMCAgMzIgMzMgMzQgMzUgMzYgMzcg
MzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjAyYjAgIDM4
IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2
Nzg5MDEyMwowMmMwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAz
OCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDJkMCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzgg
MzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjAyZTAgIDM2IDM3IDM4IDM5
IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQow
MmYwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIz
NDU2Nzg5MDEyMzQ1NjcKMDMwMCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkg
MzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjAzMTAgIDM0IDM1IDM2IDM3IDM4IDM5IDMw
IDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowMzIwICAzMCAz
MSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkw
MTIzNDUKMDMzMCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAg
MzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjAzNDAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMx
IDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowMzUwICAzOCAzOSAzMCAzMSAz
MiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDM2
MCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3
ODkwMTIzNDU2Nzg5CjAzNzAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMy
IDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowMzgwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAz
MyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDM5MCAgMzIgMzMg
MzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0
NTY3CjAzYTAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMz
ICAgODkwMTIzNDU2Nzg5MDEyMwowM2IwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAz
NCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDNjMCAgMzAgMzEgMzIgMzMgMzQg
MzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjAzZDAg
IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAx
MjM0NTY3ODkwMQowM2UwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAz
NSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDNmMCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUg
MzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjA0MDAgIDM0IDM1IDM2
IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4
OQowNDEwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAg
IDAxMjM0NTY3ODkwMTIzNDUKMDQyMCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYg
MzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjA0MzAgIDMyIDMzIDM0IDM1IDM2IDM3
IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowNDQwICAz
OCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1
Njc4OTAxMjMKMDQ1MCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcg
MzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjA0NjAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4
IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowNDcwICAzNiAzNyAzOCAz
OSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEK
MDQ4MCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAy
MzQ1Njc4OTAxMjM0NTY3CjA0OTAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5
IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowNGEwICAzNCAzNSAzNiAzNyAzOCAzOSAz
MCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDRiMCAgMzAg
MzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5
MDEyMzQ1CjA0YzAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMw
IDMxICAgNjc4OTAxMjM0NTY3ODkwMQowNGQwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAz
MSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDRlMCAgMzggMzkgMzAgMzEg
MzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjA0
ZjAgIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2
Nzg5MDEyMzQ1Njc4OQowNTAwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAz
MiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDUxMCAgMzYgMzcgMzggMzkgMzAgMzEgMzIg
MzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjA1MjAgIDMyIDMz
IDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIz
NDU2NwowNTMwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAz
MyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDU0MCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMg
MzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjA1NTAgIDMwIDMxIDMyIDMzIDM0
IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowNTYw
ICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkw
MTIzNDU2Nzg5MDEKMDU3MCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQg
MzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjA1ODAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1
IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowNTkwICAzNCAzNSAz
NiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3
ODkKMDVhMCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAgICAgICAgICAgICAgICAgICAgICAg
ICAwMTIzNDU2NwogICAgRGF0YTogMzAzMTMyMzMzNDM1MzYzNzM4MzkzMDMxMzIzMzM0MzUzNjM3
MzgzOTMwMzEzMjMzLi4uCiAgICBbTGVuZ3RoOiAxNDQ4XQoKTm8uICAgICBUaW1lICAgICAgICAg
ICBTb3VyY2UgICAgICAgICAgICAgICAgRGVzdGluYXRpb24gICAgICAgICAgIFByb3RvY29sIExl
bmd0aCBJbmZvCiAgIDM3OTQgNS43ODQ4OTQwMDAgICAgMTkyLjE2OC4yNTQuNTIgICAgICAgIDE5
Mi4xNjguMjU0LjEgICAgICAgICBUQ1AgICAgICAxNTE0ICAgNTI3MzQgPiA1MDAxIFtBQ0tdIFNl
cT0zMDY2ODg5IEFjaz0xIFdpbj0xMzE3NjAgTGVuPTE0NDggVFN2YWw9MTMwMjUxNDAxMSBUU2Vj
cj0zMjg3NDY1ODIKCkZyYW1lIDM3OTQ6IDE1MTQgYnl0ZXMgb24gd2lyZSAoMTIxMTIgYml0cyks
IDE1MTQgYnl0ZXMgY2FwdHVyZWQgKDEyMTEyIGJpdHMpIG9uIGludGVyZmFjZSAwCiAgICBJbnRl
cmZhY2UgaWQ6IDAKICAgIEVuY2Fwc3VsYXRpb24gdHlwZTogRXRoZXJuZXQgKDEpCiAgICBBcnJp
dmFsIFRpbWU6IEp1bCAgOCwgMjAxNCAxMToyNDozOC4xNzE1ODEwMDAgUERUCiAgICBbVGltZSBz
aGlmdCBmb3IgdGhpcyBwYWNrZXQ6IDAuMDAwMDAwMDAwIHNlY29uZHNdCiAgICBFcG9jaCBUaW1l
OiAxNDA0ODQzODc4LjE3MTU4MTAwMCBzZWNvbmRzCiAgICBbVGltZSBkZWx0YSBmcm9tIHByZXZp
b3VzIGNhcHR1cmVkIGZyYW1lOiAwLjAwMDAyOTAwMCBzZWNvbmRzXQogICAgW1RpbWUgZGVsdGEg
ZnJvbSBwcmV2aW91cyBkaXNwbGF5ZWQgZnJhbWU6IDAuMDAwMDI5MDAwIHNlY29uZHNdCiAgICBb
VGltZSBzaW5jZSByZWZlcmVuY2Ugb3IgZmlyc3QgZnJhbWU6IDUuNzg0ODk0MDAwIHNlY29uZHNd
CiAgICBGcmFtZSBOdW1iZXI6IDM3OTQKICAgIEZyYW1lIExlbmd0aDogMTUxNCBieXRlcyAoMTIx
MTIgYml0cykKICAgIENhcHR1cmUgTGVuZ3RoOiAxNTE0IGJ5dGVzICgxMjExMiBiaXRzKQogICAg
W0ZyYW1lIGlzIG1hcmtlZDogVHJ1ZV0KICAgIFtGcmFtZSBpcyBpZ25vcmVkOiBGYWxzZV0KICAg
IFtQcm90b2NvbHMgaW4gZnJhbWU6IGV0aDppcDp0Y3A6ZGF0YV0KICAgIFtDb2xvcmluZyBSdWxl
IE5hbWU6IFRDUF0KICAgIFtDb2xvcmluZyBSdWxlIFN0cmluZzogdGNwXQpFdGhlcm5ldCBJSSwg
U3JjOiBBcHBsZV82NzoyNDo1NCAoODQ6Mzg6MzU6Njc6MjQ6NTQpLCBEc3Q6IEludGVsXzVlOmJk
Ojg1ICgwMDowZTowYzo1ZTpiZDo4NSkKICAgIERlc3RpbmF0aW9uOiBJbnRlbF81ZTpiZDo4NSAo
MDA6MGU6MGM6NWU6YmQ6ODUpCiAgICAgICAgQWRkcmVzczogSW50ZWxfNWU6YmQ6ODUgKDAwOjBl
OjBjOjVlOmJkOjg1KQogICAgICAgIC4uLi4gLi4wLiAuLi4uIC4uLi4gLi4uLiAuLi4uID0gTEcg
Yml0OiBHbG9iYWxseSB1bmlxdWUgYWRkcmVzcyAoZmFjdG9yeSBkZWZhdWx0KQogICAgICAgIC4u
Li4gLi4uMCAuLi4uIC4uLi4gLi4uLiAuLi4uID0gSUcgYml0OiBJbmRpdmlkdWFsIGFkZHJlc3Mg
KHVuaWNhc3QpCiAgICBTb3VyY2U6IEFwcGxlXzY3OjI0OjU0ICg4NDozODozNTo2NzoyNDo1NCkK
ICAgICAgICBBZGRyZXNzOiBBcHBsZV82NzoyNDo1NCAoODQ6Mzg6MzU6Njc6MjQ6NTQpCiAgICAg
ICAgLi4uLiAuLjAuIC4uLi4gLi4uLiAuLi4uIC4uLi4gPSBMRyBiaXQ6IEdsb2JhbGx5IHVuaXF1
ZSBhZGRyZXNzIChmYWN0b3J5IGRlZmF1bHQpCiAgICAgICAgLi4uLiAuLi4wIC4uLi4gLi4uLiAu
Li4uIC4uLi4gPSBJRyBiaXQ6IEluZGl2aWR1YWwgYWRkcmVzcyAodW5pY2FzdCkKICAgIFR5cGU6
IElQICgweDA4MDApCkludGVybmV0IFByb3RvY29sIFZlcnNpb24gNCwgU3JjOiAxOTIuMTY4LjI1
NC41MiAoMTkyLjE2OC4yNTQuNTIpLCBEc3Q6IDE5Mi4xNjguMjU0LjEgKDE5Mi4xNjguMjU0LjEp
CiAgICBWZXJzaW9uOiA0CiAgICBIZWFkZXIgbGVuZ3RoOiAyMCBieXRlcwogICAgRGlmZmVyZW50
aWF0ZWQgU2VydmljZXMgRmllbGQ6IDB4MDAgKERTQ1AgMHgwMDogRGVmYXVsdDsgRUNOOiAweDAw
OiBOb3QtRUNUIChOb3QgRUNOLUNhcGFibGUgVHJhbnNwb3J0KSkKICAgICAgICAwMDAwIDAwLi4g
PSBEaWZmZXJlbnRpYXRlZCBTZXJ2aWNlcyBDb2RlcG9pbnQ6IERlZmF1bHQgKDB4MDApCiAgICAg
ICAgLi4uLiAuLjAwID0gRXhwbGljaXQgQ29uZ2VzdGlvbiBOb3RpZmljYXRpb246IE5vdC1FQ1Qg
KE5vdCBFQ04tQ2FwYWJsZSBUcmFuc3BvcnQpICgweDAwKQogICAgVG90YWwgTGVuZ3RoOiAxNTAw
CiAgICBJZGVudGlmaWNhdGlvbjogMHhjMTI3ICg0OTQ0NykKICAgIEZsYWdzOiAweDAyIChEb24n
dCBGcmFnbWVudCkKICAgICAgICAwLi4uIC4uLi4gPSBSZXNlcnZlZCBiaXQ6IE5vdCBzZXQKICAg
ICAgICAuMS4uIC4uLi4gPSBEb24ndCBmcmFnbWVudDogU2V0CiAgICAgICAgLi4wLiAuLi4uID0g
TW9yZSBmcmFnbWVudHM6IE5vdCBzZXQKICAgIEZyYWdtZW50IG9mZnNldDogMAogICAgVGltZSB0
byBsaXZlOiA2NAogICAgUHJvdG9jb2w6IFRDUCAoNikKICAgIEhlYWRlciBjaGVja3N1bTogMHhm
NjZjIFtjb3JyZWN0XQogICAgICAgIFtHb29kOiBUcnVlXQogICAgICAgIFtCYWQ6IEZhbHNlXQog
ICAgU291cmNlOiAxOTIuMTY4LjI1NC41MiAoMTkyLjE2OC4yNTQuNTIpCiAgICBEZXN0aW5hdGlv
bjogMTkyLjE2OC4yNTQuMSAoMTkyLjE2OC4yNTQuMSkKICAgIFtTb3VyY2UgR2VvSVA6IFVua25v
d25dCiAgICBbRGVzdGluYXRpb24gR2VvSVA6IFVua25vd25dClRyYW5zbWlzc2lvbiBDb250cm9s
IFByb3RvY29sLCBTcmMgUG9ydDogNTI3MzQgKDUyNzM0KSwgRHN0IFBvcnQ6IDUwMDEgKDUwMDEp
LCBTZXE6IDMwNjY4ODksIEFjazogMSwgTGVuOiAxNDQ4CiAgICBTb3VyY2UgcG9ydDogNTI3MzQg
KDUyNzM0KQogICAgRGVzdGluYXRpb24gcG9ydDogNTAwMSAoNTAwMSkKICAgIFtTdHJlYW0gaW5k
ZXg6IDBdCiAgICBTZXF1ZW5jZSBudW1iZXI6IDMwNjY4ODkgICAgKHJlbGF0aXZlIHNlcXVlbmNl
IG51bWJlcikKICAgIFtOZXh0IHNlcXVlbmNlIG51bWJlcjogMzA2ODMzNyAgICAocmVsYXRpdmUg
c2VxdWVuY2UgbnVtYmVyKV0KICAgIEFja25vd2xlZGdtZW50IG51bWJlcjogMSAgICAocmVsYXRp
dmUgYWNrIG51bWJlcikKICAgIEhlYWRlciBsZW5ndGg6IDMyIGJ5dGVzCiAgICBGbGFnczogMHgw
MTAgKEFDSykKICAgICAgICAwMDAuIC4uLi4gLi4uLiA9IFJlc2VydmVkOiBOb3Qgc2V0CiAgICAg
ICAgLi4uMCAuLi4uIC4uLi4gPSBOb25jZTogTm90IHNldAogICAgICAgIC4uLi4gMC4uLiAuLi4u
ID0gQ29uZ2VzdGlvbiBXaW5kb3cgUmVkdWNlZCAoQ1dSKTogTm90IHNldAogICAgICAgIC4uLi4g
LjAuLiAuLi4uID0gRUNOLUVjaG86IE5vdCBzZXQKICAgICAgICAuLi4uIC4uMC4gLi4uLiA9IFVy
Z2VudDogTm90IHNldAogICAgICAgIC4uLi4gLi4uMSAuLi4uID0gQWNrbm93bGVkZ21lbnQ6IFNl
dAogICAgICAgIC4uLi4gLi4uLiAwLi4uID0gUHVzaDogTm90IHNldAogICAgICAgIC4uLi4gLi4u
LiAuMC4uID0gUmVzZXQ6IE5vdCBzZXQKICAgICAgICAuLi4uIC4uLi4gLi4wLiA9IFN5bjogTm90
IHNldAogICAgICAgIC4uLi4gLi4uLiAuLi4wID0gRmluOiBOb3Qgc2V0CiAgICBXaW5kb3cgc2l6
ZSB2YWx1ZTogODIzNQogICAgW0NhbGN1bGF0ZWQgd2luZG93IHNpemU6IDEzMTc2MF0KICAgIFtX
aW5kb3cgc2l6ZSBzY2FsaW5nIGZhY3RvcjogMTZdCiAgICBDaGVja3N1bTogMHgxM2M4IFtjb3Jy
ZWN0XQogICAgICAgIFtHb29kIENoZWNrc3VtOiBUcnVlXQogICAgICAgIFtCYWQgQ2hlY2tzdW06
IEZhbHNlXQogICAgT3B0aW9uczogKDEyIGJ5dGVzKSwgTm8tT3BlcmF0aW9uIChOT1ApLCBOby1P
cGVyYXRpb24gKE5PUCksIFRpbWVzdGFtcHMKICAgICAgICBOby1PcGVyYXRpb24gKE5PUCkKICAg
ICAgICAgICAgVHlwZTogMQogICAgICAgICAgICAgICAgMC4uLiAuLi4uID0gQ29weSBvbiBmcmFn
bWVudGF0aW9uOiBObwogICAgICAgICAgICAgICAgLjAwLiAuLi4uID0gQ2xhc3M6IENvbnRyb2wg
KDApCiAgICAgICAgICAgICAgICAuLi4wIDAwMDEgPSBOdW1iZXI6IE5vLU9wZXJhdGlvbiAoTk9Q
KSAoMSkKICAgICAgICBOby1PcGVyYXRpb24gKE5PUCkKICAgICAgICAgICAgVHlwZTogMQogICAg
ICAgICAgICAgICAgMC4uLiAuLi4uID0gQ29weSBvbiBmcmFnbWVudGF0aW9uOiBObwogICAgICAg
ICAgICAgICAgLjAwLiAuLi4uID0gQ2xhc3M6IENvbnRyb2wgKDApCiAgICAgICAgICAgICAgICAu
Li4wIDAwMDEgPSBOdW1iZXI6IE5vLU9wZXJhdGlvbiAoTk9QKSAoMSkKICAgICAgICBUaW1lc3Rh
bXBzOiBUU3ZhbCAxMzAyNTE0MDExLCBUU2VjciAzMjg3NDY1ODIKICAgICAgICAgICAgS2luZDog
VGltZXN0YW1wICg4KQogICAgICAgICAgICBMZW5ndGg6IDEwCiAgICAgICAgICAgIFRpbWVzdGFt
cCB2YWx1ZTogMTMwMjUxNDAxMQogICAgICAgICAgICBUaW1lc3RhbXAgZWNobyByZXBseTogMzI4
NzQ2NTgyCiAgICBbU0VRL0FDSyBhbmFseXNpc10KICAgICAgICBbQnl0ZXMgaW4gZmxpZ2h0OiA3
MjQwXQpEYXRhICgxNDQ4IGJ5dGVzKQoKMDAwMCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYg
MzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjAwMTAgIDM0IDM1IDM2IDM3
IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQow
MDIwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAx
MjM0NTY3ODkwMTIzNDUKMDAzMCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcg
MzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjAwNDAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4
IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowMDUwICAzOCAz
OSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4
OTAxMjMKMDA2MCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzgg
MzkgICA0NTY3ODkwMTIzNDU2Nzg5CjAwNzAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5
IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowMDgwICAzNiAzNyAzOCAzOSAz
MCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDA5
MCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1
Njc4OTAxMjM0NTY3CjAwYTAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMw
IDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowMGIwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAz
MSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDBjMCAgMzAgMzEg
MzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEy
MzQ1CjAwZDAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMx
ICAgNjc4OTAxMjM0NTY3ODkwMQowMGUwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAz
MiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDBmMCAgMzggMzkgMzAgMzEgMzIg
MzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjAxMDAg
IDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5
MDEyMzQ1Njc4OQowMTEwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAz
MyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDEyMCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMg
MzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjAxMzAgIDMyIDMzIDM0
IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2
NwowMTQwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAg
IDg5MDEyMzQ1Njc4OTAxMjMKMDE1MCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQg
MzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjAxNjAgIDMwIDMxIDMyIDMzIDM0IDM1
IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowMTcwICAz
NiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIz
NDU2Nzg5MDEKMDE4MCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUg
MzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjAxOTAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2
IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowMWEwICAzNCAzNSAzNiAz
NyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkK
MDFiMCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAw
MTIzNDU2Nzg5MDEyMzQ1CjAxYzAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3
IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQowMWQwICAzMiAzMyAzNCAzNSAzNiAzNyAz
OCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDFlMCAgMzgg
MzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3
ODkwMTIzCjAxZjAgIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4
IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowMjAwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAz
OSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDIxMCAgMzYgMzcgMzggMzkg
MzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjAy
MjAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0
NTY3ODkwMTIzNDU2NwowMjMwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAz
MCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDI0MCAgMzQgMzUgMzYgMzcgMzggMzkgMzAg
MzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjAyNTAgIDMwIDMx
IDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAx
MjM0NQowMjYwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAz
MSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDI3MCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEg
MzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjAyODAgIDM4IDM5IDMwIDMxIDMy
IDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowMjkw
ICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4
OTAxMjM0NTY3ODkKMDJhMCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIg
MzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjAyYjAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMz
IDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQowMmMwICAzMiAzMyAz
NCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1
NjcKMDJkMCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMg
ICA4OTAxMjM0NTY3ODkwMTIzCjAyZTAgIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0
IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowMmYwICAzMCAzMSAzMiAzMyAzNCAz
NSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDMwMCAg
MzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEy
MzQ1Njc4OTAxCjAzMTAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1
IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowMzIwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAz
NiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDMzMCAgMzQgMzUgMzYg
MzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5
CjAzNDAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAg
MDEyMzQ1Njc4OTAxMjM0NQowMzUwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAz
NyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDM2MCAgMzIgMzMgMzQgMzUgMzYgMzcg
MzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjAzNzAgIDM4
IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2
Nzg5MDEyMwowMzgwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAz
OCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDM5MCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzgg
MzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjAzYTAgIDM2IDM3IDM4IDM5
IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQow
M2IwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIz
NDU2Nzg5MDEyMzQ1NjcKMDNjMCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkg
MzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjAzZDAgIDM0IDM1IDM2IDM3IDM4IDM5IDMw
IDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowM2UwICAzMCAz
MSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkw
MTIzNDUKMDNmMCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAg
MzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjA0MDAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMx
IDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowNDEwICAzOCAzOSAzMCAzMSAz
MiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDQy
MCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3
ODkwMTIzNDU2Nzg5CjA0MzAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMy
IDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowNDQwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAz
MyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDQ1MCAgMzIgMzMg
MzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0
NTY3CjA0NjAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMz
ICAgODkwMTIzNDU2Nzg5MDEyMwowNDcwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAz
NCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDQ4MCAgMzAgMzEgMzIgMzMgMzQg
MzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjA0OTAg
IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAx
MjM0NTY3ODkwMQowNGEwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAz
NSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDRiMCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUg
MzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjA0YzAgIDM0IDM1IDM2
IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4
OQowNGQwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAg
IDAxMjM0NTY3ODkwMTIzNDUKMDRlMCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYg
MzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjA0ZjAgIDMyIDMzIDM0IDM1IDM2IDM3
IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowNTAwICAz
OCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1
Njc4OTAxMjMKMDUxMCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcg
MzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjA1MjAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4
IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowNTMwICAzNiAzNyAzOCAz
OSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEK
MDU0MCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAy
MzQ1Njc4OTAxMjM0NTY3CjA1NTAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5
IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowNTYwICAzNCAzNSAzNiAzNyAzOCAzOSAz
MCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDU3MCAgMzAg
MzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5
MDEyMzQ1CjA1ODAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMw
IDMxICAgNjc4OTAxMjM0NTY3ODkwMQowNTkwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAz
MSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDVhMCAgMzggMzkgMzAgMzEg
MzIgMzMgMzQgMzUgICAgICAgICAgICAgICAgICAgICAgICAgICA4OTAxMjM0NQogICAgRGF0YTog
MzgzOTMwMzEzMjMzMzQzNTM2MzczODM5MzAzMTMyMzMzNDM1MzYzNzM4MzkzMDMxLi4uCiAgICBb
TGVuZ3RoOiAxNDQ4XQo=
--001a1135eef0a6fea104fdbc8bfa
Content-Type: text/plain; charset=US-ASCII; name="server.txt"
Content-Disposition: attachment; filename="server.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hxe8u5uc1

Tm8uICAgICBUaW1lICAgICAgICBTb3VyY2UgICAgICAgICAgICAgICAgRGVzdGluYXRpb24gICAg
ICAgICAgIFByb3RvY29sIExlbmd0aCBJbmZvCiAgIDM4ODYgNC41OTQ5NjkgICAgMTkyLjE2OC4y
NTQuNTIgICAgICAgIDE5Mi4xNjguMjU0LjEgICAgICAgICBUQ1AgICAgICAxNTE0ICAgW1RDUCBS
ZXRyYW5zbWlzc2lvbl0gNTI3MzQgPiA1MDAxIFtBQ0tdIFNlcT0zMDY1NDQxIEFjaz0xIFdpbj0x
MzE3NjAgW1RDUCBDSEVDS1NVTSBJTkNPUlJFQ1RdIExlbj0xNDQ4IFRTdmFsPTEzMDI1MTQwMTEg
VFNlY3I9MzI4NzQ2NTgyCgpGcmFtZSAzODg2OiAxNTE0IGJ5dGVzIG9uIHdpcmUgKDEyMTEyIGJp
dHMpLCAxNTE0IGJ5dGVzIGNhcHR1cmVkICgxMjExMiBiaXRzKQogICAgRW5jYXBzdWxhdGlvbiB0
eXBlOiBFdGhlcm5ldCAoMSkKICAgIEFycml2YWwgVGltZTogSnVsICA4LCAyMDE0IDExOjI0OjM5
LjA4NDYxNDAwMCBQRFQKICAgIFtUaW1lIHNoaWZ0IGZvciB0aGlzIHBhY2tldDogMC4wMDAwMDAw
MDAgc2Vjb25kc10KICAgIEVwb2NoIFRpbWU6IDE0MDQ4NDM4NzkuMDg0NjE0MDAwIHNlY29uZHMK
ICAgIFtUaW1lIGRlbHRhIGZyb20gcHJldmlvdXMgY2FwdHVyZWQgZnJhbWU6IDAuMDAwMDQxMDAw
IHNlY29uZHNdCiAgICBbVGltZSBkZWx0YSBmcm9tIHByZXZpb3VzIGRpc3BsYXllZCBmcmFtZTog
MC4wMDAwNDEwMDAgc2Vjb25kc10KICAgIFtUaW1lIHNpbmNlIHJlZmVyZW5jZSBvciBmaXJzdCBm
cmFtZTogNC41OTQ5NjkwMDAgc2Vjb25kc10KICAgIEZyYW1lIE51bWJlcjogMzg4NgogICAgRnJh
bWUgTGVuZ3RoOiAxNTE0IGJ5dGVzICgxMjExMiBiaXRzKQogICAgQ2FwdHVyZSBMZW5ndGg6IDE1
MTQgYnl0ZXMgKDEyMTEyIGJpdHMpCiAgICBbRnJhbWUgaXMgbWFya2VkOiBUcnVlXQogICAgW0Zy
YW1lIGlzIGlnbm9yZWQ6IEZhbHNlXQogICAgW1Byb3RvY29scyBpbiBmcmFtZTogZXRoOmlwOnRj
cDpkYXRhXQogICAgW0NvbG9yaW5nIFJ1bGUgTmFtZTogVENQXQogICAgW0NvbG9yaW5nIFJ1bGUg
U3RyaW5nOiB0Y3BdCkV0aGVybmV0IElJLCBTcmM6IEFwcGxlXzY3OjI0OjU0ICg4NDozODozNTo2
NzoyNDo1NCksIERzdDogSW50ZWxfNWU6YmQ6ODUgKDAwOjBlOjBjOjVlOmJkOjg1KQogICAgRGVz
dGluYXRpb246IEludGVsXzVlOmJkOjg1ICgwMDowZTowYzo1ZTpiZDo4NSkKICAgICAgICBBZGRy
ZXNzOiBJbnRlbF81ZTpiZDo4NSAoMDA6MGU6MGM6NWU6YmQ6ODUpCiAgICAgICAgLi4uLiAuLjAu
IC4uLi4gLi4uLiAuLi4uIC4uLi4gPSBMRyBiaXQ6IEdsb2JhbGx5IHVuaXF1ZSBhZGRyZXNzIChm
YWN0b3J5IGRlZmF1bHQpCiAgICAgICAgLi4uLiAuLi4wIC4uLi4gLi4uLiAuLi4uIC4uLi4gPSBJ
RyBiaXQ6IEluZGl2aWR1YWwgYWRkcmVzcyAodW5pY2FzdCkKICAgIFNvdXJjZTogQXBwbGVfNjc6
MjQ6NTQgKDg0OjM4OjM1OjY3OjI0OjU0KQogICAgICAgIEFkZHJlc3M6IEFwcGxlXzY3OjI0OjU0
ICg4NDozODozNTo2NzoyNDo1NCkKICAgICAgICAuLi4uIC4uMC4gLi4uLiAuLi4uIC4uLi4gLi4u
LiA9IExHIGJpdDogR2xvYmFsbHkgdW5pcXVlIGFkZHJlc3MgKGZhY3RvcnkgZGVmYXVsdCkKICAg
ICAgICAuLi4uIC4uLjAgLi4uLiAuLi4uIC4uLi4gLi4uLiA9IElHIGJpdDogSW5kaXZpZHVhbCBh
ZGRyZXNzICh1bmljYXN0KQogICAgVHlwZTogSVAgKDB4MDgwMCkKSW50ZXJuZXQgUHJvdG9jb2wg
VmVyc2lvbiA0LCBTcmM6IDE5Mi4xNjguMjU0LjUyICgxOTIuMTY4LjI1NC41MiksIERzdDogMTky
LjE2OC4yNTQuMSAoMTkyLjE2OC4yNTQuMSkKICAgIFZlcnNpb246IDQKICAgIEhlYWRlciBsZW5n
dGg6IDIwIGJ5dGVzCiAgICBEaWZmZXJlbnRpYXRlZCBTZXJ2aWNlcyBGaWVsZDogMHgwMCAoRFND
UCAweDAwOiBEZWZhdWx0OyBFQ046IDB4MDA6IE5vdC1FQ1QgKE5vdCBFQ04tQ2FwYWJsZSBUcmFu
c3BvcnQpKQogICAgICAgIDAwMDAgMDAuLiA9IERpZmZlcmVudGlhdGVkIFNlcnZpY2VzIENvZGVw
b2ludDogRGVmYXVsdCAoMHgwMCkKICAgICAgICAuLi4uIC4uMDAgPSBFeHBsaWNpdCBDb25nZXN0
aW9uIE5vdGlmaWNhdGlvbjogTm90LUVDVCAoTm90IEVDTi1DYXBhYmxlIFRyYW5zcG9ydCkgKDB4
MDApCiAgICBUb3RhbCBMZW5ndGg6IDE1MDAKICAgIElkZW50aWZpY2F0aW9uOiAweGEwM2QgKDQx
MDIxKQogICAgRmxhZ3M6IDB4MDIgKERvbid0IEZyYWdtZW50KQogICAgICAgIDAuLi4gLi4uLiA9
IFJlc2VydmVkIGJpdDogTm90IHNldAogICAgICAgIC4xLi4gLi4uLiA9IERvbid0IGZyYWdtZW50
OiBTZXQKICAgICAgICAuLjAuIC4uLi4gPSBNb3JlIGZyYWdtZW50czogTm90IHNldAogICAgRnJh
Z21lbnQgb2Zmc2V0OiAwCiAgICBUaW1lIHRvIGxpdmU6IDY0CiAgICBQcm90b2NvbDogVENQICg2
KQogICAgSGVhZGVyIGNoZWNrc3VtOiAweDE3NTcgW2NvcnJlY3RdCiAgICAgICAgW0dvb2Q6IFRy
dWVdCiAgICAgICAgW0JhZDogRmFsc2VdCiAgICBTb3VyY2U6IDE5Mi4xNjguMjU0LjUyICgxOTIu
MTY4LjI1NC41MikKICAgIERlc3RpbmF0aW9uOiAxOTIuMTY4LjI1NC4xICgxOTIuMTY4LjI1NC4x
KQogICAgW1NvdXJjZSBHZW9JUDogVW5rbm93bl0KICAgIFtEZXN0aW5hdGlvbiBHZW9JUDogVW5r
bm93bl0KVHJhbnNtaXNzaW9uIENvbnRyb2wgUHJvdG9jb2wsIFNyYyBQb3J0OiA1MjczNCAoNTI3
MzQpLCBEc3QgUG9ydDogNTAwMSAoNTAwMSksIFNlcTogMzA2NTQ0MSwgQWNrOiAxLCBMZW46IDE0
NDgKICAgIFNvdXJjZSBwb3J0OiA1MjczNCAoNTI3MzQpCiAgICBEZXN0aW5hdGlvbiBwb3J0OiA1
MDAxICg1MDAxKQogICAgW1N0cmVhbSBpbmRleDogMF0KICAgIFNlcXVlbmNlIG51bWJlcjogMzA2
NTQ0MSAgICAocmVsYXRpdmUgc2VxdWVuY2UgbnVtYmVyKQogICAgW05leHQgc2VxdWVuY2UgbnVt
YmVyOiAzMDY2ODg5ICAgIChyZWxhdGl2ZSBzZXF1ZW5jZSBudW1iZXIpXQogICAgQWNrbm93bGVk
Z21lbnQgbnVtYmVyOiAxICAgIChyZWxhdGl2ZSBhY2sgbnVtYmVyKQogICAgSGVhZGVyIGxlbmd0
aDogMzIgYnl0ZXMKICAgIEZsYWdzOiAweDAxMCAoQUNLKQogICAgICAgIDAwMC4gLi4uLiAuLi4u
ID0gUmVzZXJ2ZWQ6IE5vdCBzZXQKICAgICAgICAuLi4wIC4uLi4gLi4uLiA9IE5vbmNlOiBOb3Qg
c2V0CiAgICAgICAgLi4uLiAwLi4uIC4uLi4gPSBDb25nZXN0aW9uIFdpbmRvdyBSZWR1Y2VkIChD
V1IpOiBOb3Qgc2V0CiAgICAgICAgLi4uLiAuMC4uIC4uLi4gPSBFQ04tRWNobzogTm90IHNldAog
ICAgICAgIC4uLi4gLi4wLiAuLi4uID0gVXJnZW50OiBOb3Qgc2V0CiAgICAgICAgLi4uLiAuLi4x
IC4uLi4gPSBBY2tub3dsZWRnbWVudDogU2V0CiAgICAgICAgLi4uLiAuLi4uIDAuLi4gPSBQdXNo
OiBOb3Qgc2V0CiAgICAgICAgLi4uLiAuLi4uIC4wLi4gPSBSZXNldDogTm90IHNldAogICAgICAg
IC4uLi4gLi4uLiAuLjAuID0gU3luOiBOb3Qgc2V0CiAgICAgICAgLi4uLiAuLi4uIC4uLjAgPSBG
aW46IE5vdCBzZXQKICAgIFdpbmRvdyBzaXplIHZhbHVlOiA4MjM1CiAgICBbQ2FsY3VsYXRlZCB3
aW5kb3cgc2l6ZTogMTMxNzYwXQogICAgW1dpbmRvdyBzaXplIHNjYWxpbmcgZmFjdG9yOiAxNl0K
ICAgIENoZWNrc3VtOiAweDFiNzIgW2luY29ycmVjdCwgc2hvdWxkIGJlIDB4MmFjOSAobWF5YmUg
Y2F1c2VkIGJ5ICJUQ1AgY2hlY2tzdW0gb2ZmbG9hZCI/KV0KICAgICAgICBbR29vZCBDaGVja3N1
bTogRmFsc2VdCiAgICAgICAgW0JhZCBDaGVja3N1bTogVHJ1ZV0KICAgICAgICAgICAgW0V4cGVy
dCBJbmZvIChFcnJvci9DaGVja3N1bSk6IEJhZCBjaGVja3N1bV0KICAgICAgICAgICAgICAgIFtN
ZXNzYWdlOiBCYWQgY2hlY2tzdW1dCiAgICAgICAgICAgICAgICBbU2V2ZXJpdHkgbGV2ZWw6IEVy
cm9yXQogICAgICAgICAgICAgICAgW0dyb3VwOiBDaGVja3N1bV0KICAgIE9wdGlvbnM6ICgxMiBi
eXRlcyksIE5vLU9wZXJhdGlvbiAoTk9QKSwgTm8tT3BlcmF0aW9uIChOT1ApLCBUaW1lc3RhbXBz
CiAgICAgICAgTm8tT3BlcmF0aW9uIChOT1ApCiAgICAgICAgICAgIFR5cGU6IDEKICAgICAgICAg
ICAgICAgIDAuLi4gLi4uLiA9IENvcHkgb24gZnJhZ21lbnRhdGlvbjogTm8KICAgICAgICAgICAg
ICAgIC4wMC4gLi4uLiA9IENsYXNzOiBDb250cm9sICgwKQogICAgICAgICAgICAgICAgLi4uMCAw
MDAxID0gTnVtYmVyOiBOby1PcGVyYXRpb24gKE5PUCkgKDEpCiAgICAgICAgTm8tT3BlcmF0aW9u
IChOT1ApCiAgICAgICAgICAgIFR5cGU6IDEKICAgICAgICAgICAgICAgIDAuLi4gLi4uLiA9IENv
cHkgb24gZnJhZ21lbnRhdGlvbjogTm8KICAgICAgICAgICAgICAgIC4wMC4gLi4uLiA9IENsYXNz
OiBDb250cm9sICgwKQogICAgICAgICAgICAgICAgLi4uMCAwMDAxID0gTnVtYmVyOiBOby1PcGVy
YXRpb24gKE5PUCkgKDEpCiAgICAgICAgVGltZXN0YW1wczogVFN2YWwgMTMwMjUxNDAxMSwgVFNl
Y3IgMzI4NzQ2NTgyCiAgICAgICAgICAgIEtpbmQ6IFRpbWVzdGFtcCAoOCkKICAgICAgICAgICAg
TGVuZ3RoOiAxMAogICAgICAgICAgICBUaW1lc3RhbXAgdmFsdWU6IDEzMDI1MTQwMTEKICAgICAg
ICAgICAgVGltZXN0YW1wIGVjaG8gcmVwbHk6IDMyODc0NjU4MgogICAgW1NFUS9BQ0sgYW5hbHlz
aXNdCiAgICAgICAgW0J5dGVzIGluIGZsaWdodDogODE0MTYxMjI0XQogICAgICAgIFtUQ1AgQW5h
bHlzaXMgRmxhZ3NdCiAgICAgICAgICAgIFtUaGlzIGZyYW1lIGlzIGEgKHN1c3BlY3RlZCkgcmV0
cmFuc21pc3Npb25dCiAgICAgICAgICAgICAgICBbRXhwZXJ0IEluZm8gKE5vdGUvU2VxdWVuY2Up
OiBSZXRyYW5zbWlzc2lvbiAoc3VzcGVjdGVkKV0KICAgICAgICAgICAgICAgICAgICBbTWVzc2Fn
ZTogUmV0cmFuc21pc3Npb24gKHN1c3BlY3RlZCldCiAgICAgICAgICAgICAgICAgICAgW1NldmVy
aXR5IGxldmVsOiBOb3RlXQogICAgICAgICAgICAgICAgICAgIFtHcm91cDogU2VxdWVuY2VdCiAg
ICAgICAgICAgIFtUaGUgUlRPIGZvciB0aGlzIHNlZ21lbnQgd2FzOiAxLjM3MTgxOTAwMCBzZWNv
bmRzXQogICAgICAgICAgICBbUlRPIGJhc2VkIG9uIGRlbHRhIGZyb20gZnJhbWU6IDEwMzhdCkRh
dGEgKDE0NDggYnl0ZXMpCgowMDAwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAz
MSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDAxMCAgMzYgMzcgMzggMzkgMzAgMzEg
MzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjAwMjAgIDMy
IDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkw
MTIzNDU2NwowMDMwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAz
MiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDA0MCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIg
MzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjAwNTAgIDMwIDMxIDMyIDMz
IDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQow
MDYwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3
ODkwMTIzNDU2Nzg5MDEKMDA3MCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMg
MzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjAwODAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0
IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowMDkwICAzNCAz
NSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0
NTY3ODkKMDBhMCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQg
MzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjAwYjAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1
IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQowMGMwICAzMiAzMyAzNCAzNSAz
NiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDBk
MCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAx
MjM0NTY3ODkwMTIzCjAwZTAgIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2
IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowMGYwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAz
NyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDEwMCAgMzYgMzcg
MzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4
OTAxCjAxMTAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3
ICAgMjM0NTY3ODkwMTIzNDU2NwowMTIwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAz
OCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDEzMCAgMzQgMzUgMzYgMzcgMzgg
MzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjAxNDAg
IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1
Njc4OTAxMjM0NQowMTUwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAz
OSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDE2MCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkg
MzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjAxNzAgIDM4IDM5IDMw
IDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEy
MwowMTgwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAg
IDQ1Njc4OTAxMjM0NTY3ODkKMDE5MCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAg
MzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjAxYTAgIDM2IDM3IDM4IDM5IDMwIDMx
IDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQowMWIwICAz
MiAzMyAzNCAzNSAzNiAzNyAzOCAzOSA5YSAzMSAzOCAxOSA5NCBiNyAzNiAzNyAgIDIzNDU2Nzg5
LjE4Li4uNjcKMDFjMCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgOTEg
OTIgYjEgICA4OTAxMjM0NTY3ODkwLi4uCjAxZDAgIDljIDFmIDM2IDM3IDM4IDM5IDMwIDMxIDMy
IDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgLi42Nzg5MDEyMzQ1Njc4OQowMWUwICAzMCAzMSAzMiAz
MyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUK
MDFmMCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2
Nzg5MDEyMzQ1Njc4OTAxCjAyMDAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMz
IDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowMjEwICAzOCAzOSAzMCAzMSAzMiAzMyAz
NCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDIyMCAgMzQg
MzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIz
NDU2Nzg5CjAyMzAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0
IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowMjQwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAz
NSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDI1MCAgMzIgMzMgMzQgMzUg
MzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjAy
NjAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkw
MTIzNDU2Nzg5MDEyMwowMjcwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAz
NiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDI4MCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYg
MzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjAyOTAgIDM2IDM3
IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3
ODkwMQowMmEwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAz
NyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDJiMCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcg
MzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjAyYzAgIDM0IDM1IDM2IDM3IDM4
IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowMmQw
ICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0
NTY3ODkwMTIzNDUKMDJlMCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMjAgNjEgMjMgMjIgM2Mg
MzkgMzAgMzEgICA2Nzg5MDEyMyBhIyI8OTAxCjAyZjAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5
IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowMzAwICAzOCAzOSAz
MCAzMSAzMiAxMSAzNiAzZiA5YyAzZCAzYSBiMSAzOCAxOSA5YSA5OSAgIDg5MDEyLjY/Lj06Ljgu
Li4KMDMxMCAgMzQgYmQgMTQgOWQgYjIgYjMgOTggYjMgMzggM2IgMTYgYjcgMTQgOWQgYjIgMWIg
ICA0Li4uLi4uLjg7Li4uLi4uCjAzMjAgIDNhIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMw
IDMxIDMyIDMzIDM0IDM1ICAgOjEyMzQ1Njc4OTAxMjM0NQowMzMwICAzNiAzNyAzOCAzOSAzMCAz
MSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDM0MCAg
MzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4
OTAxMjM0NTY3CjAzNTAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMx
IDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowMzYwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAz
MiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDM3MCAgMzAgMzEgMzIg
MzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgNzQgMzAgICAwMTIzNDU2Nzg5MDEyM3Qw
CjAzODAgIDMyIDM2IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAg
MjY4OTAxMjM0NTY3ODkwMQowMzkwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAz
MyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDNhMCAgMzggMzkgMzAgMzEgMzIgMzMg
MzQgMzUgMzYgMzcgMWEgM2IgM2EgOWIgOWEgYmIgICA4OTAxMjM0NTY3Ljs6Li4uCjAzYjAgIDM2
IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNjU2Nzg5MDEy
MzQ1Njc4OQowM2MwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAz
NCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDNkMCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQg
MzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjAzZTAgIDMyIDMzIDM0IDM1
IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2Nwow
M2YwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5
MDEyMzQ1Njc4OTAxMjMKMDQwMCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUg
MzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjA0MTAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2
IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowNDIwICAzNiAz
NyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2
Nzg5MDEKMDQzMCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYg
MzcgICAyMzQ1Njc4OTAxMjM0NTY3CjA0NDAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3
IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowNDUwICAzNCAzNSAzNiAzNyAz
OCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDQ2
MCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIz
NDU2Nzg5MDEyMzQ1CjA0NzAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4
IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQowNDgwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAz
OSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDQ5MCAgMzggMzkg
MzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkw
MTIzCjA0YTAgIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5
ICAgNDU2Nzg5MDEyMzQ1Njc4OQowNGIwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAz
MCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDRjMCAgMzYgMzcgMzggMzkgMzAg
MzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjA0ZDAg
IDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3
ODkwMTIzNDU2NwowNGUwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAz
MSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDRmMCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEg
MzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjA1MDAgIDMwIDMxIDMy
IDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0
NQowNTEwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAg
IDY3ODkwMTIzNDU2Nzg5MDEKMDUyMCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIg
MzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjA1MzAgIDM4IDM5IDMwIDMxIDMyIDMz
IDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowNTQwICAz
NCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAx
MjM0NTY3ODkKMDU1MCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMg
MzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjA1NjAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0
IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQowNTcwICAzMiAzMyAzNCAz
NSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcK
MDU4MCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4
OTAxMjM0NTY3ODkwMTIzCjA1OTAgIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1
IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowNWEwICAzMCAzMSAzMiAzMyAzNCAzNSAz
NiAzNyAgICAgICAgICAgICAgICAgICAgICAgICAgIDAxMjM0NTY3CiAgICBEYXRhOiAzMDMxMzIz
MzM0MzUzNjM3MzgzOTMwMzEzMjMzMzQzNTM2MzczODM5MzAzMTMyMzMuLi4KICAgIFtMZW5ndGg6
IDE0NDhdCgpOby4gICAgIFRpbWUgICAgICAgIFNvdXJjZSAgICAgICAgICAgICAgICBEZXN0aW5h
dGlvbiAgICAgICAgICAgUHJvdG9jb2wgTGVuZ3RoIEluZm8KICAgMzg5MSA0LjU5NTMzMCAgICAx
OTIuMTY4LjI1NC41MiAgICAgICAgMTkyLjE2OC4yNTQuMSAgICAgICAgIFRDUCAgICAgIDE1MTQg
ICBbVENQIE91dC1PZi1PcmRlcl0gNTI3MzQgPiA1MDAxIFtBQ0tdIFNlcT0zMDY1NDQxIEFjaz0x
IFdpbj0xMzE3NjAgTGVuPTE0NDggVFN2YWw9MTMwMjUxNDAxMSBUU2Vjcj0zMjg3NDY1ODIKCkZy
YW1lIDM4OTE6IDE1MTQgYnl0ZXMgb24gd2lyZSAoMTIxMTIgYml0cyksIDE1MTQgYnl0ZXMgY2Fw
dHVyZWQgKDEyMTEyIGJpdHMpCiAgICBFbmNhcHN1bGF0aW9uIHR5cGU6IEV0aGVybmV0ICgxKQog
ICAgQXJyaXZhbCBUaW1lOiBKdWwgIDgsIDIwMTQgMTE6MjQ6MzkuMDg0OTc1MDAwIFBEVAogICAg
W1RpbWUgc2hpZnQgZm9yIHRoaXMgcGFja2V0OiAwLjAwMDAwMDAwMCBzZWNvbmRzXQogICAgRXBv
Y2ggVGltZTogMTQwNDg0Mzg3OS4wODQ5NzUwMDAgc2Vjb25kcwogICAgW1RpbWUgZGVsdGEgZnJv
bSBwcmV2aW91cyBjYXB0dXJlZCBmcmFtZTogMC4wMDAwMDYwMDAgc2Vjb25kc10KICAgIFtUaW1l
IGRlbHRhIGZyb20gcHJldmlvdXMgZGlzcGxheWVkIGZyYW1lOiAwLjAwMDAwNjAwMCBzZWNvbmRz
XQogICAgW1RpbWUgc2luY2UgcmVmZXJlbmNlIG9yIGZpcnN0IGZyYW1lOiA0LjU5NTMzMDAwMCBz
ZWNvbmRzXQogICAgRnJhbWUgTnVtYmVyOiAzODkxCiAgICBGcmFtZSBMZW5ndGg6IDE1MTQgYnl0
ZXMgKDEyMTEyIGJpdHMpCiAgICBDYXB0dXJlIExlbmd0aDogMTUxNCBieXRlcyAoMTIxMTIgYml0
cykKICAgIFtGcmFtZSBpcyBtYXJrZWQ6IFRydWVdCiAgICBbRnJhbWUgaXMgaWdub3JlZDogRmFs
c2VdCiAgICBbUHJvdG9jb2xzIGluIGZyYW1lOiBldGg6aXA6dGNwOmRhdGFdCiAgICBbQ29sb3Jp
bmcgUnVsZSBOYW1lOiBUQ1BdCiAgICBbQ29sb3JpbmcgUnVsZSBTdHJpbmc6IHRjcF0KRXRoZXJu
ZXQgSUksIFNyYzogQXBwbGVfNjc6MjQ6NTQgKDg0OjM4OjM1OjY3OjI0OjU0KSwgRHN0OiBJbnRl
bF81ZTpiZDo4NSAoMDA6MGU6MGM6NWU6YmQ6ODUpCiAgICBEZXN0aW5hdGlvbjogSW50ZWxfNWU6
YmQ6ODUgKDAwOjBlOjBjOjVlOmJkOjg1KQogICAgICAgIEFkZHJlc3M6IEludGVsXzVlOmJkOjg1
ICgwMDowZTowYzo1ZTpiZDo4NSkKICAgICAgICAuLi4uIC4uMC4gLi4uLiAuLi4uIC4uLi4gLi4u
LiA9IExHIGJpdDogR2xvYmFsbHkgdW5pcXVlIGFkZHJlc3MgKGZhY3RvcnkgZGVmYXVsdCkKICAg
ICAgICAuLi4uIC4uLjAgLi4uLiAuLi4uIC4uLi4gLi4uLiA9IElHIGJpdDogSW5kaXZpZHVhbCBh
ZGRyZXNzICh1bmljYXN0KQogICAgU291cmNlOiBBcHBsZV82NzoyNDo1NCAoODQ6Mzg6MzU6Njc6
MjQ6NTQpCiAgICAgICAgQWRkcmVzczogQXBwbGVfNjc6MjQ6NTQgKDg0OjM4OjM1OjY3OjI0OjU0
KQogICAgICAgIC4uLi4gLi4wLiAuLi4uIC4uLi4gLi4uLiAuLi4uID0gTEcgYml0OiBHbG9iYWxs
eSB1bmlxdWUgYWRkcmVzcyAoZmFjdG9yeSBkZWZhdWx0KQogICAgICAgIC4uLi4gLi4uMCAuLi4u
IC4uLi4gLi4uLiAuLi4uID0gSUcgYml0OiBJbmRpdmlkdWFsIGFkZHJlc3MgKHVuaWNhc3QpCiAg
ICBUeXBlOiBJUCAoMHgwODAwKQpJbnRlcm5ldCBQcm90b2NvbCBWZXJzaW9uIDQsIFNyYzogMTky
LjE2OC4yNTQuNTIgKDE5Mi4xNjguMjU0LjUyKSwgRHN0OiAxOTIuMTY4LjI1NC4xICgxOTIuMTY4
LjI1NC4xKQogICAgVmVyc2lvbjogNAogICAgSGVhZGVyIGxlbmd0aDogMjAgYnl0ZXMKICAgIERp
ZmZlcmVudGlhdGVkIFNlcnZpY2VzIEZpZWxkOiAweDAwIChEU0NQIDB4MDA6IERlZmF1bHQ7IEVD
TjogMHgwMDogTm90LUVDVCAoTm90IEVDTi1DYXBhYmxlIFRyYW5zcG9ydCkpCiAgICAgICAgMDAw
MCAwMC4uID0gRGlmZmVyZW50aWF0ZWQgU2VydmljZXMgQ29kZXBvaW50OiBEZWZhdWx0ICgweDAw
KQogICAgICAgIC4uLi4gLi4wMCA9IEV4cGxpY2l0IENvbmdlc3Rpb24gTm90aWZpY2F0aW9uOiBO
b3QtRUNUIChOb3QgRUNOLUNhcGFibGUgVHJhbnNwb3J0KSAoMHgwMCkKICAgIFRvdGFsIExlbmd0
aDogMTUwMAogICAgSWRlbnRpZmljYXRpb246IDB4YTAzZCAoNDEwMjEpCiAgICBGbGFnczogMHgw
MiAoRG9uJ3QgRnJhZ21lbnQpCiAgICAgICAgMC4uLiAuLi4uID0gUmVzZXJ2ZWQgYml0OiBOb3Qg
c2V0CiAgICAgICAgLjEuLiAuLi4uID0gRG9uJ3QgZnJhZ21lbnQ6IFNldAogICAgICAgIC4uMC4g
Li4uLiA9IE1vcmUgZnJhZ21lbnRzOiBOb3Qgc2V0CiAgICBGcmFnbWVudCBvZmZzZXQ6IDAKICAg
IFRpbWUgdG8gbGl2ZTogNjQKICAgIFByb3RvY29sOiBUQ1AgKDYpCiAgICBIZWFkZXIgY2hlY2tz
dW06IDB4MTc1NyBbY29ycmVjdF0KICAgICAgICBbR29vZDogVHJ1ZV0KICAgICAgICBbQmFkOiBG
YWxzZV0KICAgIFNvdXJjZTogMTkyLjE2OC4yNTQuNTIgKDE5Mi4xNjguMjU0LjUyKQogICAgRGVz
dGluYXRpb246IDE5Mi4xNjguMjU0LjEgKDE5Mi4xNjguMjU0LjEpCiAgICBbU291cmNlIEdlb0lQ
OiBVbmtub3duXQogICAgW0Rlc3RpbmF0aW9uIEdlb0lQOiBVbmtub3duXQpUcmFuc21pc3Npb24g
Q29udHJvbCBQcm90b2NvbCwgU3JjIFBvcnQ6IDUyNzM0ICg1MjczNCksIERzdCBQb3J0OiA1MDAx
ICg1MDAxKSwgU2VxOiAzMDY1NDQxLCBBY2s6IDEsIExlbjogMTQ0OAogICAgU291cmNlIHBvcnQ6
IDUyNzM0ICg1MjczNCkKICAgIERlc3RpbmF0aW9uIHBvcnQ6IDUwMDEgKDUwMDEpCiAgICBbU3Ry
ZWFtIGluZGV4OiAwXQogICAgU2VxdWVuY2UgbnVtYmVyOiAzMDY1NDQxICAgIChyZWxhdGl2ZSBz
ZXF1ZW5jZSBudW1iZXIpCiAgICBbTmV4dCBzZXF1ZW5jZSBudW1iZXI6IDMwNjY4ODkgICAgKHJl
bGF0aXZlIHNlcXVlbmNlIG51bWJlcildCiAgICBBY2tub3dsZWRnbWVudCBudW1iZXI6IDEgICAg
KHJlbGF0aXZlIGFjayBudW1iZXIpCiAgICBIZWFkZXIgbGVuZ3RoOiAzMiBieXRlcwogICAgRmxh
Z3M6IDB4MDEwIChBQ0spCiAgICAgICAgMDAwLiAuLi4uIC4uLi4gPSBSZXNlcnZlZDogTm90IHNl
dAogICAgICAgIC4uLjAgLi4uLiAuLi4uID0gTm9uY2U6IE5vdCBzZXQKICAgICAgICAuLi4uIDAu
Li4gLi4uLiA9IENvbmdlc3Rpb24gV2luZG93IFJlZHVjZWQgKENXUik6IE5vdCBzZXQKICAgICAg
ICAuLi4uIC4wLi4gLi4uLiA9IEVDTi1FY2hvOiBOb3Qgc2V0CiAgICAgICAgLi4uLiAuLjAuIC4u
Li4gPSBVcmdlbnQ6IE5vdCBzZXQKICAgICAgICAuLi4uIC4uLjEgLi4uLiA9IEFja25vd2xlZGdt
ZW50OiBTZXQKICAgICAgICAuLi4uIC4uLi4gMC4uLiA9IFB1c2g6IE5vdCBzZXQKICAgICAgICAu
Li4uIC4uLi4gLjAuLiA9IFJlc2V0OiBOb3Qgc2V0CiAgICAgICAgLi4uLiAuLi4uIC4uMC4gPSBT
eW46IE5vdCBzZXQKICAgICAgICAuLi4uIC4uLi4gLi4uMCA9IEZpbjogTm90IHNldAogICAgV2lu
ZG93IHNpemUgdmFsdWU6IDgyMzUKICAgIFtDYWxjdWxhdGVkIHdpbmRvdyBzaXplOiAxMzE3NjBd
CiAgICBbV2luZG93IHNpemUgc2NhbGluZyBmYWN0b3I6IDE2XQogICAgQ2hlY2tzdW06IDB4MWI3
MiBbY29ycmVjdF0KICAgICAgICBbR29vZCBDaGVja3N1bTogVHJ1ZV0KICAgICAgICBbQmFkIENo
ZWNrc3VtOiBGYWxzZV0KICAgIE9wdGlvbnM6ICgxMiBieXRlcyksIE5vLU9wZXJhdGlvbiAoTk9Q
KSwgTm8tT3BlcmF0aW9uIChOT1ApLCBUaW1lc3RhbXBzCiAgICAgICAgTm8tT3BlcmF0aW9uIChO
T1ApCiAgICAgICAgICAgIFR5cGU6IDEKICAgICAgICAgICAgICAgIDAuLi4gLi4uLiA9IENvcHkg
b24gZnJhZ21lbnRhdGlvbjogTm8KICAgICAgICAgICAgICAgIC4wMC4gLi4uLiA9IENsYXNzOiBD
b250cm9sICgwKQogICAgICAgICAgICAgICAgLi4uMCAwMDAxID0gTnVtYmVyOiBOby1PcGVyYXRp
b24gKE5PUCkgKDEpCiAgICAgICAgTm8tT3BlcmF0aW9uIChOT1ApCiAgICAgICAgICAgIFR5cGU6
IDEKICAgICAgICAgICAgICAgIDAuLi4gLi4uLiA9IENvcHkgb24gZnJhZ21lbnRhdGlvbjogTm8K
ICAgICAgICAgICAgICAgIC4wMC4gLi4uLiA9IENsYXNzOiBDb250cm9sICgwKQogICAgICAgICAg
ICAgICAgLi4uMCAwMDAxID0gTnVtYmVyOiBOby1PcGVyYXRpb24gKE5PUCkgKDEpCiAgICAgICAg
VGltZXN0YW1wczogVFN2YWwgMTMwMjUxNDAxMSwgVFNlY3IgMzI4NzQ2NTgyCiAgICAgICAgICAg
IEtpbmQ6IFRpbWVzdGFtcCAoOCkKICAgICAgICAgICAgTGVuZ3RoOiAxMAogICAgICAgICAgICBU
aW1lc3RhbXAgdmFsdWU6IDEzMDI1MTQwMTEKICAgICAgICAgICAgVGltZXN0YW1wIGVjaG8gcmVw
bHk6IDMyODc0NjU4MgogICAgW1NFUS9BQ0sgYW5hbHlzaXNdCiAgICAgICAgW1RDUCBBbmFseXNp
cyBGbGFnc10KICAgICAgICAgICAgW1RoaXMgZnJhbWUgaXMgYSAoc3VzcGVjdGVkKSBvdXQtb2Yt
b3JkZXIgc2VnbWVudF0KICAgICAgICAgICAgICAgIFtFeHBlcnQgSW5mbyAoV2Fybi9TZXF1ZW5j
ZSk6IE91dC1PZi1PcmRlciBzZWdtZW50XQogICAgICAgICAgICAgICAgICAgIFtNZXNzYWdlOiBP
dXQtT2YtT3JkZXIgc2VnbWVudF0KICAgICAgICAgICAgICAgICAgICBbU2V2ZXJpdHkgbGV2ZWw6
IFdhcm5dCiAgICAgICAgICAgICAgICAgICAgW0dyb3VwOiBTZXF1ZW5jZV0KRGF0YSAoMTQ0OCBi
eXRlcykKCjAwMDAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0
IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowMDEwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAz
NSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDAyMCAgMzIgMzMgMzQgMzUg
MzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjAw
MzAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkw
MTIzNDU2Nzg5MDEyMwowMDQwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAz
NiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDA1MCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYg
MzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjAwNjAgIDM2IDM3
IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3
ODkwMQowMDcwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAz
NyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDA4MCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcg
MzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjAwOTAgIDM0IDM1IDM2IDM3IDM4
IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowMGEw
ICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0
NTY3ODkwMTIzNDUKMDBiMCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzgg
MzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjAwYzAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5
IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowMGQwICAzOCAzOSAz
MCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAx
MjMKMDBlMCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkg
ICA0NTY3ODkwMTIzNDU2Nzg5CjAwZjAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMw
IDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowMTAwICAzNiAzNyAzOCAzOSAzMCAz
MSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDExMCAg
MzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4
OTAxMjM0NTY3CjAxMjAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMx
IDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowMTMwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAz
MiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDE0MCAgMzAgMzEgMzIg
MzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1
CjAxNTAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAg
Njc4OTAxMjM0NTY3ODkwMQowMTYwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAz
MyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDE3MCAgMzggMzkgMzAgMzEgMzIgMzMg
MzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjAxODAgIDM0
IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEy
MzQ1Njc4OQowMTkwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAz
NCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDFhMCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQg
MzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjAxYjAgIDMyIDMzIDM0IDM1
IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2Nwow
MWMwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5
MDEyMzQ1Njc4OTAxMjMKMDFkMCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUg
MzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjAxZTAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2
IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowMWYwICAzNiAz
NyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2
Nzg5MDEKMDIwMCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYg
MzcgICAyMzQ1Njc4OTAxMjM0NTY3CjAyMTAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3
IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowMjIwICAzNCAzNSAzNiAzNyAz
OCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDIz
MCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIz
NDU2Nzg5MDEyMzQ1CjAyNDAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4
IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQowMjUwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAz
OSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDI2MCAgMzggMzkg
MzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkw
MTIzCjAyNzAgIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5
ICAgNDU2Nzg5MDEyMzQ1Njc4OQowMjgwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAz
MCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDI5MCAgMzYgMzcgMzggMzkgMzAg
MzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjAyYTAg
IDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3
ODkwMTIzNDU2NwowMmIwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAz
MSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDJjMCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEg
MzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjAyZDAgIDMwIDMxIDMy
IDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0
NQowMmUwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAg
IDY3ODkwMTIzNDU2Nzg5MDEKMDJmMCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIg
MzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjAzMDAgIDM4IDM5IDMwIDMxIDMyIDMz
IDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowMzEwICAz
NCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAx
MjM0NTY3ODkKMDMyMCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMg
MzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjAzMzAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0
IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQowMzQwICAzMiAzMyAzNCAz
NSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcK
MDM1MCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4
OTAxMjM0NTY3ODkwMTIzCjAzNjAgIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1
IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowMzcwICAzMCAzMSAzMiAzMyAzNCAzNSAz
NiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDM4MCAgMzYg
MzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1
Njc4OTAxCjAzOTAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2
IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowM2EwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAz
NyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDNiMCAgMzQgMzUgMzYgMzcg
MzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjAz
YzAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEy
MzQ1Njc4OTAxMjM0NQowM2QwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAz
OCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDNlMCAgMzIgMzMgMzQgMzUgMzYgMzcgMzgg
MzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjAzZjAgIDM4IDM5
IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5
MDEyMwowNDAwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAz
OSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDQxMCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkg
MzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjA0MjAgIDM2IDM3IDM4IDM5IDMw
IDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQowNDMw
ICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2
Nzg5MDEyMzQ1NjcKMDQ0MCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAg
MzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjA0NTAgIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMx
IDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowNDYwICAzMCAzMSAz
MiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIz
NDUKMDQ3MCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEg
ICA2Nzg5MDEyMzQ1Njc4OTAxCjA0ODAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMy
IDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowNDkwICAzOCAzOSAzMCAzMSAzMiAz
MyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDRhMCAg
MzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkw
MTIzNDU2Nzg5CjA0YjAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMz
IDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowNGMwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAz
NCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDRkMCAgMzIgMzMgMzQg
MzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3
CjA0ZTAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAg
ODkwMTIzNDU2Nzg5MDEyMwowNGYwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAz
NSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDUwMCAgMzAgMzEgMzIgMzMgMzQgMzUg
MzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjA1MTAgIDM2
IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0
NTY3ODkwMQowNTIwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAz
NiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDUzMCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYg
MzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjA1NDAgIDM0IDM1IDM2IDM3
IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQow
NTUwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAx
MjM0NTY3ODkwMTIzNDUKMDU2MCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcg
MzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjA1NzAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4
IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowNTgwICAzOCAz
OSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4
OTAxMjMKMDU5MCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzgg
MzkgICA0NTY3ODkwMTIzNDU2Nzg5CjA1YTAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgMDEyMzQ1NjcKICAgIERhdGE6IDMwMzEzMjMzMzQzNTM2Mzcz
ODM5MzAzMTMyMzMzNDM1MzYzNzM4MzkzMDMxMzIzMy4uLgogICAgW0xlbmd0aDogMTQ0OF0K
--001a1135eef0a6fea104fdbc8bfa
Content-Type: text/plain; charset=US-ASCII; name="wifisniffer.txt"
Content-Disposition: attachment; filename="wifisniffer.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hxe8u5uh2

Tm8uICAgICBUaW1lICAgICAgICBTb3VyY2UgICAgICAgICAgICAgICAgRGVzdGluYXRpb24gICAg
ICAgICAgIFByb3RvY29sIExlbmd0aCBJbmZvCiAgIDU1NDkgMTUuNjA4NjE3ICAgMTkyLjE2OC4y
NTQuNTIgICAgICAgIDE5Mi4xNjguMjU0LjEgICAgICAgICBUQ1AgICAgICAzMTEwICAgNTI3MzQg
PiA1MDAxIFtBQ0tdIFNlcT0zMDY2ODg5IEFjaz0xIFdpbj0xMzE3NjAgW1RDUCBDSEVDS1NVTSBJ
TkNPUlJFQ1RdIExlbj0xNDQ4IFRTdmFsPTEzMDI1MTQwMTEgVFNlY3I9MzI4NzQ2NTgyCgpGcmFt
ZSA1NTQ5OiAzMTEwIGJ5dGVzIG9uIHdpcmUgKDI0ODgwIGJpdHMpLCAzMTEwIGJ5dGVzIGNhcHR1
cmVkICgyNDg4MCBiaXRzKQogICAgRW5jYXBzdWxhdGlvbiB0eXBlOiBJRUVFIDgwMi4xMSBwbHVz
IHJhZGlvdGFwIHJhZGlvIGhlYWRlciAoMjMpCiAgICBBcnJpdmFsIFRpbWU6IEp1bCAgOCwgMjAx
NCAxMToyNDozOS4wODIzNzEwMDAgUERUCiAgICBbVGltZSBzaGlmdCBmb3IgdGhpcyBwYWNrZXQ6
IDAuMDAwMDAwMDAwIHNlY29uZHNdCiAgICBFcG9jaCBUaW1lOiAxNDA0ODQzODc5LjA4MjM3MTAw
MCBzZWNvbmRzCiAgICBbVGltZSBkZWx0YSBmcm9tIHByZXZpb3VzIGNhcHR1cmVkIGZyYW1lOiAw
LjAwMDA3OTAwMCBzZWNvbmRzXQogICAgW1RpbWUgZGVsdGEgZnJvbSBwcmV2aW91cyBkaXNwbGF5
ZWQgZnJhbWU6IDAuMDAwMDc5MDAwIHNlY29uZHNdCiAgICBbVGltZSBzaW5jZSByZWZlcmVuY2Ug
b3IgZmlyc3QgZnJhbWU6IDE1LjYwODYxNzAwMCBzZWNvbmRzXQogICAgRnJhbWUgTnVtYmVyOiA1
NTQ5CiAgICBGcmFtZSBMZW5ndGg6IDMxMTAgYnl0ZXMgKDI0ODgwIGJpdHMpCiAgICBDYXB0dXJl
IExlbmd0aDogMzExMCBieXRlcyAoMjQ4ODAgYml0cykKICAgIFtGcmFtZSBpcyBtYXJrZWQ6IFRy
dWVdCiAgICBbRnJhbWUgaXMgaWdub3JlZDogRmFsc2VdCiAgICBbUHJvdG9jb2xzIGluIGZyYW1l
OiByYWRpb3RhcDp3bGFuOmxsYzppcDp0Y3A6ZGF0YTpsbGM6aXA6dGNwOmRhdGFdCiAgICBbQ29s
b3JpbmcgUnVsZSBOYW1lOiBUQ1BdCiAgICBbQ29sb3JpbmcgUnVsZSBTdHJpbmc6IHRjcF0KUmFk
aW90YXAgSGVhZGVyIHYwLCBMZW5ndGggMzgKICAgIEhlYWRlciByZXZpc2lvbjogMAogICAgSGVh
ZGVyIHBhZDogMAogICAgSGVhZGVyIGxlbmd0aDogMzgKICAgIFByZXNlbnQgZmxhZ3MKICAgICAg
ICAuLi4uIC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4uLiAuLi4uIC4uLjEgPSBUU0ZUOiBUcnVlCiAg
ICAgICAgLi4uLiAuLi4uIC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4uLiAuLjEuID0gRmxhZ3M6IFRy
dWUKICAgICAgICAuLi4uIC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4uLiAuLi4uIC4wLi4gPSBSYXRl
OiBGYWxzZQogICAgICAgIC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4uLiAuLi4uIC4uLi4gMS4uLiA9
IENoYW5uZWw6IFRydWUKICAgICAgICAuLi4uIC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4uLiAuLi4w
IC4uLi4gPSBGSFNTOiBGYWxzZQogICAgICAgIC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4uLiAuLi4u
IC4uMS4gLi4uLiA9IGRCbSBBbnRlbm5hIFNpZ25hbDogVHJ1ZQogICAgICAgIC4uLi4gLi4uLiAu
Li4uIC4uLi4gLi4uLiAuLi4uIC4wLi4gLi4uLiA9IGRCbSBBbnRlbm5hIE5vaXNlOiBGYWxzZQog
ICAgICAgIC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4uLiAuLi4uIDAuLi4gLi4uLiA9IExvY2sgUXVh
bGl0eTogRmFsc2UKICAgICAgICAuLi4uIC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4uMCAuLi4uIC4u
Li4gPSBUWCBBdHRlbnVhdGlvbjogRmFsc2UKICAgICAgICAuLi4uIC4uLi4gLi4uLiAuLi4uIC4u
Li4gLi4wLiAuLi4uIC4uLi4gPSBkQiBUWCBBdHRlbnVhdGlvbjogRmFsc2UKICAgICAgICAuLi4u
IC4uLi4gLi4uLiAuLi4uIC4uLi4gLjAuLiAuLi4uIC4uLi4gPSBkQm0gVFggUG93ZXI6IEZhbHNl
CiAgICAgICAgLi4uLiAuLi4uIC4uLi4gLi4uLiAuLi4uIDEuLi4gLi4uLiAuLi4uID0gQW50ZW5u
YTogVHJ1ZQogICAgICAgIC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4uMCAuLi4uIC4uLi4gLi4uLiA9
IGRCIEFudGVubmEgU2lnbmFsOiBGYWxzZQogICAgICAgIC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4w
LiAuLi4uIC4uLi4gLi4uLiA9IGRCIEFudGVubmEgTm9pc2U6IEZhbHNlCiAgICAgICAgLi4uLiAu
Li4uIC4uLi4gLi4uLiAuMS4uIC4uLi4gLi4uLiAuLi4uID0gUlggZmxhZ3M6IFRydWUKICAgICAg
ICAuLi4uIC4uLi4gLi4uLiAuMC4uIC4uLi4gLi4uLiAuLi4uIC4uLi4gPSBDaGFubmVsKzogRmFs
c2UKICAgICAgICAuLi4uIC4uLi4gLi4uLiAwLi4uIC4uLi4gLi4uLiAuLi4uIC4uLi4gPSBIVCBp
bmZvcm1hdGlvbjogRmFsc2UKICAgICAgICAuLi4uIC4uLi4gLi4uMCAuLi4uIC4uLi4gLi4uLiAu
Li4uIC4uLi4gPSBBLU1QRFUgU3RhdHVzOiBGYWxzZQogICAgICAgIC4uLi4gLi4uLiAuLjEuIC4u
Li4gLi4uLiAuLi4uIC4uLi4gLi4uLiA9IFZIVCBpbmZvcm1hdGlvbjogVHJ1ZQogICAgICAgIC4u
LjAgMDAwMCAwMC4uIC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4uLiA9IFJlc2VydmVkOiAweDAwMDAw
MDAwCiAgICAgICAgLi4wLiAuLi4uIC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4uLiAuLi4uID0gUmFk
aW90YXAgTlMgbmV4dDogRmFsc2UKICAgICAgICAuMC4uIC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4u
LiAuLi4uIC4uLi4gPSBWZW5kb3IgTlMgbmV4dDogRmFsc2UKICAgICAgICAwLi4uIC4uLi4gLi4u
LiAuLi4uIC4uLi4gLi4uLiAuLi4uIC4uLi4gPSBFeHQ6IEZhbHNlCiAgICBNQUMgdGltZXN0YW1w
OiAxMzk1NTQyMzA4CiAgICBGbGFnczogMHg0MAogICAgICAgIC4uLi4gLi4uMCA9IENGUDogRmFs
c2UKICAgICAgICAuLi4uIC4uMC4gPSBQcmVhbWJsZTogTG9uZwogICAgICAgIC4uLi4gLjAuLiA9
IFdFUDogRmFsc2UKICAgICAgICAuLi4uIDAuLi4gPSBGcmFnbWVudGF0aW9uOiBGYWxzZQogICAg
ICAgIC4uLjAgLi4uLiA9IEZDUyBhdCBlbmQ6IEZhbHNlCiAgICAgICAgLi4wLiAuLi4uID0gRGF0
YSBQYWQ6IEZhbHNlCiAgICAgICAgLjEuLiAuLi4uID0gQmFkIEZDUzogVHJ1ZQogICAgICAgIDAu
Li4gLi4uLiA9IFNob3J0IEdJOiBGYWxzZQogICAgQ2hhbm5lbCBmcmVxdWVuY3k6IDU3NDUgW0Eg
MTQ5XQogICAgQ2hhbm5lbCB0eXBlOiA4MDIuMTFhICgweDAxNDApCiAgICAgICAgLi4uLiAuLi4u
IC4uLjAgLi4uLiA9IFR1cmJvOiBGYWxzZQogICAgICAgIC4uLi4gLi4uLiAuLjAuIC4uLi4gPSBD
b21wbGVtZW50YXJ5IENvZGUgS2V5aW5nIChDQ0spOiBGYWxzZQogICAgICAgIC4uLi4gLi4uLiAu
MS4uIC4uLi4gPSBPcnRob2dvbmFsIEZyZXF1ZW5jeS1EaXZpc2lvbiBNdWx0aXBsZXhpbmcgKE9G
RE0pOiBUcnVlCiAgICAgICAgLi4uLiAuLi4uIDAuLi4gLi4uLiA9IDIgR0h6IHNwZWN0cnVtOiBG
YWxzZQogICAgICAgIC4uLi4gLi4uMSAuLi4uIC4uLi4gPSA1IEdIeiBzcGVjdHJ1bTogVHJ1ZQog
ICAgICAgIC4uLi4gLi4wLiAuLi4uIC4uLi4gPSBQYXNzaXZlOiBGYWxzZQogICAgICAgIC4uLi4g
LjAuLiAuLi4uIC4uLi4gPSBEeW5hbWljIENDSy1PRkRNOiBGYWxzZQogICAgICAgIC4uLi4gMC4u
LiAuLi4uIC4uLi4gPSBHYXVzc2lhbiBGcmVxdWVuY3kgU2hpZnQgS2V5aW5nIChHRlNLKTogRmFs
c2UKICAgICAgICAuLi4wIC4uLi4gLi4uLiAuLi4uID0gR1NNICg5MDBNSHopOiBGYWxzZQogICAg
ICAgIC4uMC4gLi4uLiAuLi4uIC4uLi4gPSBTdGF0aWMgVHVyYm86IEZhbHNlCiAgICAgICAgLjAu
LiAuLi4uIC4uLi4gLi4uLiA9IEhhbGYgUmF0ZSBDaGFubmVsICgxME1IeiBDaGFubmVsIFdpZHRo
KTogRmFsc2UKICAgICAgICAwLi4uIC4uLi4gLi4uLiAuLi4uID0gUXVhcnRlciBSYXRlIENoYW5u
ZWwgKDVNSHogQ2hhbm5lbCBXaWR0aCk6IEZhbHNlCiAgICBTU0kgU2lnbmFsOiAtNDYgZEJtCiAg
ICBBbnRlbm5hOiAwCiAgICBSWCBmbGFnczogMHgwMDAwCiAgICAgICAgLi4uLiAuLi4uIC4uLi4g
Li4uLiAuLi4uIC4uMC4gPSBCYWQgUExDUDogRmFsc2UKICAgIFZIVCBpbmZvcm1hdGlvbgogICAg
ICAgIEtub3duIFZIVCBpbmZvcm1hdGlvbjogMHg0NAogICAgICAgICAgICAuLi4uIC4uLi4gLi4u
LiAuLi4wID0gU1RCQzogRmFsc2UKICAgICAgICAgICAgLi4uLiAuLi4uIC4uLi4gLi4wLiA9IFRY
T1BfUFNfTk9UX0FMTE9XRUQ6IEZhbHNlCiAgICAgICAgICAgIC4uLi4gLi4uLiAuLi4uIC4xLi4g
PSBHdWFyZCBpbnRlcnZhbDogVHJ1ZQogICAgICAgICAgICAuLi4uIC4uLi4gLi4uLiAwLi4uID0g
U0dJIE5zeW0gZGlzYW1iaWd1YXRpb246IEZhbHNlCiAgICAgICAgICAgIC4uLi4gLi4uLiAuLi4w
IC4uLi4gPSBMRFBDIGV4dHJhIE9GRE0gc3ltYm9sOiBGYWxzZQogICAgICAgICAgICAuLi4uIC4u
Li4gLi4wLiAuLi4uID0gQmVhbWZvcm1lZDogRmFsc2UKICAgICAgICAgICAgLi4uLiAuLi4uIC4x
Li4gLi4uLiA9IEJhbmR3aWR0aDogVHJ1ZQogICAgICAgICAgICAuLi4uIC4uLi4gMC4uLiAuLi4u
ID0gR3JvdXAgSUQ6IEZhbHNlCiAgICAgICAgICAgIC4uLi4gLi4uMCAuLi4uIC4uLi4gPSBQYXJ0
aWFsIEFJRDogRmFsc2UKICAgICAgICAuLi4uIC4wLi4gPSBHdWFyZCBpbnRlcnZhbDogbG9uZyAo
MCkKICAgICAgICBCYW5kd2lkdGg6IDgwIE1IeiAoNCkKICAgICAgICBVc2VyIDA6IE1DUyA5CiAg
ICAgICAgICAgIDEwMDEgLi4uLiA9IE1DUyBpbmRleCAwOiA5ICgyNTYtUUFNIDUvNikKICAgICAg
ICAgICAgLi4uLiAwMDEwID0gU3BhdGlhbCBzdHJlYW1zIDA6IDIKICAgICAgICAgICAgU3BhY2Ut
dGltZSBzdHJlYW1zIDA6IDIKICAgICAgICAgICAgQ29kaW5nIDA6IEJDQyAoMCkKICAgICAgICAg
ICAgW0RhdGEgUmF0ZTogNzgwLjAgTWIvc10KSUVFRSA4MDIuMTEgUW9TIERhdGEsIEZsYWdzOiAu
Li4uLi4uVAogICAgVHlwZS9TdWJ0eXBlOiBRb1MgRGF0YSAoMHgyOCkKICAgIEZyYW1lIENvbnRy
b2wgRmllbGQ6IDB4ODgwMQogICAgICAgIC4uLi4gLi4wMCA9IFZlcnNpb246IDAKICAgICAgICAu
Li4uIDEwLi4gPSBUeXBlOiBEYXRhIGZyYW1lICgyKQogICAgICAgIDEwMDAgLi4uLiA9IFN1YnR5
cGU6IDgKICAgICAgICBGbGFnczogMHgwMQogICAgICAgICAgICAuLi4uIC4uMDEgPSBEUyBzdGF0
dXM6IEZyYW1lIGZyb20gU1RBIHRvIERTIHZpYSBhbiBBUCAoVG8gRFM6IDEgRnJvbSBEUzogMCkg
KDB4MDEpCiAgICAgICAgICAgIC4uLi4gLjAuLiA9IE1vcmUgRnJhZ21lbnRzOiBUaGlzIGlzIHRo
ZSBsYXN0IGZyYWdtZW50CiAgICAgICAgICAgIC4uLi4gMC4uLiA9IFJldHJ5OiBGcmFtZSBpcyBu
b3QgYmVpbmcgcmV0cmFuc21pdHRlZAogICAgICAgICAgICAuLi4wIC4uLi4gPSBQV1IgTUdUOiBT
VEEgd2lsbCBzdGF5IHVwCiAgICAgICAgICAgIC4uMC4gLi4uLiA9IE1vcmUgRGF0YTogTm8gZGF0
YSBidWZmZXJlZAogICAgICAgICAgICAuMC4uIC4uLi4gPSBQcm90ZWN0ZWQgZmxhZzogRGF0YSBp
cyBub3QgcHJvdGVjdGVkCiAgICAgICAgICAgIDAuLi4gLi4uLiA9IE9yZGVyIGZsYWc6IE5vdCBz
dHJpY3RseSBvcmRlcmVkCiAgICAuMDAwIDAwMDAgMDAxMSAwMDAwID0gRHVyYXRpb246IDQ4IG1p
Y3Jvc2Vjb25kcwogICAgUmVjZWl2ZXIgYWRkcmVzczogU2VuYW9OZXRfMTg6YTc6ZDAgKDg4OmRj
Ojk2OjE4OmE3OmQwKQogICAgQlNTIElkOiBTZW5hb05ldF8xODphNzpkMCAoODg6ZGM6OTY6MTg6
YTc6ZDApCiAgICBUcmFuc21pdHRlciBhZGRyZXNzOiBBcHBsZV82NzoyNDo1NCAoODQ6Mzg6MzU6
Njc6MjQ6NTQpCiAgICBTb3VyY2UgYWRkcmVzczogQXBwbGVfNjc6MjQ6NTQgKDg0OjM4OjM1OjY3
OjI0OjU0KQogICAgRGVzdGluYXRpb24gYWRkcmVzczogU2VuYW9OZXRfMTg6YTc6ZDAgKDg4OmRj
Ojk2OjE4OmE3OmQwKQogICAgRnJhZ21lbnQgbnVtYmVyOiAwCiAgICBTZXF1ZW5jZSBudW1iZXI6
IDEzOTEKICAgIFFvcyBDb250cm9sOiAweDAwODAKICAgICAgICAuLi4uIC4uLi4gLi4uLiAwMDAw
ID0gVElEOiAwCiAgICAgICAgWy4uLi4gLi4uLiAuLi4uIC4wMDAgPSBQcmlvcml0eTogQmVzdCBF
ZmZvcnQgKEJlc3QgRWZmb3J0KSAoMCldCiAgICAgICAgLi4uLiAuLi4uIC4uLjAgLi4uLiA9IFFv
UyBiaXQgNDogQml0cyA4LTE1IG9mIFFvUyBDb250cm9sIGZpZWxkIGFyZSBUWE9QIER1cmF0aW9u
IFJlcXVlc3RlZAogICAgICAgIC4uLi4gLi4uLiAuMDAuIC4uLi4gPSBBY2sgUG9saWN5OiBOb3Jt
YWwgQWNrICgweDAwMDApCiAgICAgICAgLi4uLiAuLi4uIDEuLi4gLi4uLiA9IFBheWxvYWQgVHlw
ZTogQS1NU0RVCiAgICAgICAgMDAwMCAwMDAwIC4uLi4gLi4uLiA9IFRYT1AgRHVyYXRpb24gUmVx
dWVzdGVkOiAwIChubyBUWE9QIHJlcXVlc3RlZCkKSUVFRSA4MDIuMTEgQWdncmVnYXRlIE1TRFUK
ICAgIEEtTVNEVSBTdWJmcmFtZSAjMQogICAgICAgIERlc3RpbmF0aW9uIGFkZHJlc3M6IEludGVs
XzVlOmJkOjg1ICgwMDowZTowYzo1ZTpiZDo4NSkKICAgICAgICBTb3VyY2UgYWRkcmVzczogQXBw
bGVfNjc6MjQ6NTQgKDg0OjM4OjM1OjY3OjI0OjU0KQogICAgICAgIEEtTVNEVSBMZW5ndGg6IDE1
MDgKICAgICAgICBMb2dpY2FsLUxpbmsgQ29udHJvbAogICAgICAgICAgICBEU0FQOiBTTkFQICgw
eGFhKQogICAgICAgICAgICBJRyBCaXQ6IEluZGl2aWR1YWwKICAgICAgICAgICAgU1NBUDogU05B
UCAoMHhhYSkKICAgICAgICAgICAgQ1IgQml0OiBDb21tYW5kCiAgICAgICAgICAgIENvbnRyb2wg
ZmllbGQ6IFUsIGZ1bmM9VUkgKDB4MDMpCiAgICAgICAgICAgICAgICAwMDAuIDAwLi4gPSBDb21t
YW5kOiBVbm51bWJlcmVkIEluZm9ybWF0aW9uICgweDAwKQogICAgICAgICAgICAgICAgLi4uLiAu
LjExID0gRnJhbWUgdHlwZTogVW5udW1iZXJlZCBmcmFtZSAoMHgwMykKICAgICAgICAgICAgT3Jn
YW5pemF0aW9uIENvZGU6IEVuY2Fwc3VsYXRlZCBFdGhlcm5ldCAoMHgwMDAwMDApCiAgICAgICAg
ICAgIFR5cGU6IElQICgweDA4MDApCiAgICAgICAgSW50ZXJuZXQgUHJvdG9jb2wgVmVyc2lvbiA0
LCBTcmM6IDE5Mi4xNjguMjU0LjUyICgxOTIuMTY4LjI1NC41MiksIERzdDogMTkyLjE2OC4yNTQu
MSAoMTkyLjE2OC4yNTQuMSkKICAgICAgICAgICAgVmVyc2lvbjogNAogICAgICAgICAgICBIZWFk
ZXIgbGVuZ3RoOiAyMCBieXRlcwogICAgICAgICAgICBEaWZmZXJlbnRpYXRlZCBTZXJ2aWNlcyBG
aWVsZDogMHgwMCAoRFNDUCAweDAwOiBEZWZhdWx0OyBFQ046IDB4MDA6IE5vdC1FQ1QgKE5vdCBF
Q04tQ2FwYWJsZSBUcmFuc3BvcnQpKQogICAgICAgICAgICAgICAgMDAwMCAwMC4uID0gRGlmZmVy
ZW50aWF0ZWQgU2VydmljZXMgQ29kZXBvaW50OiBEZWZhdWx0ICgweDAwKQogICAgICAgICAgICAg
ICAgLi4uLiAuLjAwID0gRXhwbGljaXQgQ29uZ2VzdGlvbiBOb3RpZmljYXRpb246IE5vdC1FQ1Qg
KE5vdCBFQ04tQ2FwYWJsZSBUcmFuc3BvcnQpICgweDAwKQogICAgICAgICAgICBUb3RhbCBMZW5n
dGg6IDE1MDAKICAgICAgICAgICAgSWRlbnRpZmljYXRpb246IDB4YTAzZCAoNDEwMjEpCiAgICAg
ICAgICAgIEZsYWdzOiAweDAyIChEb24ndCBGcmFnbWVudCkKICAgICAgICAgICAgICAgIDAuLi4g
Li4uLiA9IFJlc2VydmVkIGJpdDogTm90IHNldAogICAgICAgICAgICAgICAgLjEuLiAuLi4uID0g
RG9uJ3QgZnJhZ21lbnQ6IFNldAogICAgICAgICAgICAgICAgLi4wLiAuLi4uID0gTW9yZSBmcmFn
bWVudHM6IE5vdCBzZXQKICAgICAgICAgICAgRnJhZ21lbnQgb2Zmc2V0OiAwCiAgICAgICAgICAg
IFRpbWUgdG8gbGl2ZTogNjQKICAgICAgICAgICAgUHJvdG9jb2w6IFRDUCAoNikKICAgICAgICAg
ICAgSGVhZGVyIGNoZWNrc3VtOiAweDE3NTcgW2NvcnJlY3RdCiAgICAgICAgICAgICAgICBbR29v
ZDogVHJ1ZV0KICAgICAgICAgICAgICAgIFtCYWQ6IEZhbHNlXQogICAgICAgICAgICBTb3VyY2U6
IDE5Mi4xNjguMjU0LjUyICgxOTIuMTY4LjI1NC41MikKICAgICAgICAgICAgRGVzdGluYXRpb246
IDE5Mi4xNjguMjU0LjEgKDE5Mi4xNjguMjU0LjEpCiAgICAgICAgICAgIFtTb3VyY2UgR2VvSVA6
IFVua25vd25dCiAgICAgICAgICAgIFtEZXN0aW5hdGlvbiBHZW9JUDogVW5rbm93bl0KICAgICAg
ICBUcmFuc21pc3Npb24gQ29udHJvbCBQcm90b2NvbCwgU3JjIFBvcnQ6IDUyNzM0ICg1MjczNCks
IERzdCBQb3J0OiA1MDAxICg1MDAxKSwgU2VxOiAzMDY1NDQxLCBBY2s6IDEsIExlbjogMTQ0OAog
ICAgICAgICAgICBTb3VyY2UgcG9ydDogNTI3MzQgKDUyNzM0KQogICAgICAgICAgICBEZXN0aW5h
dGlvbiBwb3J0OiA1MDAxICg1MDAxKQogICAgICAgICAgICBbU3RyZWFtIGluZGV4OiAwXQogICAg
ICAgICAgICBTZXF1ZW5jZSBudW1iZXI6IDMwNjU0NDEgICAgKHJlbGF0aXZlIHNlcXVlbmNlIG51
bWJlcikKICAgICAgICAgICAgW05leHQgc2VxdWVuY2UgbnVtYmVyOiAzMDY2ODg5ICAgIChyZWxh
dGl2ZSBzZXF1ZW5jZSBudW1iZXIpXQogICAgICAgICAgICBBY2tub3dsZWRnbWVudCBudW1iZXI6
IDEgICAgKHJlbGF0aXZlIGFjayBudW1iZXIpCiAgICAgICAgICAgIEhlYWRlciBsZW5ndGg6IDMy
IGJ5dGVzCiAgICAgICAgICAgIEZsYWdzOiAweDAxMCAoQUNLKQogICAgICAgICAgICAgICAgMDAw
LiAuLi4uIC4uLi4gPSBSZXNlcnZlZDogTm90IHNldAogICAgICAgICAgICAgICAgLi4uMCAuLi4u
IC4uLi4gPSBOb25jZTogTm90IHNldAogICAgICAgICAgICAgICAgLi4uLiAwLi4uIC4uLi4gPSBD
b25nZXN0aW9uIFdpbmRvdyBSZWR1Y2VkIChDV1IpOiBOb3Qgc2V0CiAgICAgICAgICAgICAgICAu
Li4uIC4wLi4gLi4uLiA9IEVDTi1FY2hvOiBOb3Qgc2V0CiAgICAgICAgICAgICAgICAuLi4uIC4u
MC4gLi4uLiA9IFVyZ2VudDogTm90IHNldAogICAgICAgICAgICAgICAgLi4uLiAuLi4xIC4uLi4g
PSBBY2tub3dsZWRnbWVudDogU2V0CiAgICAgICAgICAgICAgICAuLi4uIC4uLi4gMC4uLiA9IFB1
c2g6IE5vdCBzZXQKICAgICAgICAgICAgICAgIC4uLi4gLi4uLiAuMC4uID0gUmVzZXQ6IE5vdCBz
ZXQKICAgICAgICAgICAgICAgIC4uLi4gLi4uLiAuLjAuID0gU3luOiBOb3Qgc2V0CiAgICAgICAg
ICAgICAgICAuLi4uIC4uLi4gLi4uMCA9IEZpbjogTm90IHNldAogICAgICAgICAgICBXaW5kb3cg
c2l6ZSB2YWx1ZTogODIzNQogICAgICAgICAgICBbQ2FsY3VsYXRlZCB3aW5kb3cgc2l6ZTogMTMx
NzYwXQogICAgICAgICAgICBbV2luZG93IHNpemUgc2NhbGluZyBmYWN0b3I6IDE2XQogICAgICAg
ICAgICBDaGVja3N1bTogMHgxYjcyIFtjb3JyZWN0XQogICAgICAgICAgICAgICAgW0dvb2QgQ2hl
Y2tzdW06IFRydWVdCiAgICAgICAgICAgICAgICBbQmFkIENoZWNrc3VtOiBGYWxzZV0KICAgICAg
ICAgICAgT3B0aW9uczogKDEyIGJ5dGVzKSwgTm8tT3BlcmF0aW9uIChOT1ApLCBOby1PcGVyYXRp
b24gKE5PUCksIFRpbWVzdGFtcHMKICAgICAgICAgICAgICAgIE5vLU9wZXJhdGlvbiAoTk9QKQog
ICAgICAgICAgICAgICAgICAgIFR5cGU6IDEKICAgICAgICAgICAgICAgICAgICAgICAgMC4uLiAu
Li4uID0gQ29weSBvbiBmcmFnbWVudGF0aW9uOiBObwogICAgICAgICAgICAgICAgICAgICAgICAu
MDAuIC4uLi4gPSBDbGFzczogQ29udHJvbCAoMCkKICAgICAgICAgICAgICAgICAgICAgICAgLi4u
MCAwMDAxID0gTnVtYmVyOiBOby1PcGVyYXRpb24gKE5PUCkgKDEpCiAgICAgICAgICAgICAgICBO
by1PcGVyYXRpb24gKE5PUCkKICAgICAgICAgICAgICAgICAgICBUeXBlOiAxCiAgICAgICAgICAg
ICAgICAgICAgICAgIDAuLi4gLi4uLiA9IENvcHkgb24gZnJhZ21lbnRhdGlvbjogTm8KICAgICAg
ICAgICAgICAgICAgICAgICAgLjAwLiAuLi4uID0gQ2xhc3M6IENvbnRyb2wgKDApCiAgICAgICAg
ICAgICAgICAgICAgICAgIC4uLjAgMDAwMSA9IE51bWJlcjogTm8tT3BlcmF0aW9uIChOT1ApICgx
KQogICAgICAgICAgICAgICAgVGltZXN0YW1wczogVFN2YWwgMTMwMjUxNDAxMSwgVFNlY3IgMzI4
NzQ2NTgyCiAgICAgICAgICAgICAgICAgICAgS2luZDogVGltZXN0YW1wICg4KQogICAgICAgICAg
ICAgICAgICAgIExlbmd0aDogMTAKICAgICAgICAgICAgICAgICAgICBUaW1lc3RhbXAgdmFsdWU6
IDEzMDI1MTQwMTEKICAgICAgICAgICAgICAgICAgICBUaW1lc3RhbXAgZWNobyByZXBseTogMzI4
NzQ2NTgyCiAgICAgICAgRGF0YSAoMTQ0OCBieXRlcykKCjAwMDAgIDMwIDMxIDMyIDMzIDM0IDM1
IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowMDEwICAz
NiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIz
NDU2Nzg5MDEKMDAyMCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUg
MzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjAwMzAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2
IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowMDQwICAzNCAzNSAzNiAz
NyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkK
MDA1MCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAw
MTIzNDU2Nzg5MDEyMzQ1CjAwNjAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3
IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQowMDcwICAzMiAzMyAzNCAzNSAzNiAzNyAz
OCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDA4MCAgMzgg
MzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3
ODkwMTIzCjAwOTAgIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4
IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowMGEwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAz
OSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDBiMCAgMzYgMzcgMzggMzkg
MzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjAw
YzAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0
NTY3ODkwMTIzNDU2NwowMGQwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAz
MCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDBlMCAgMzQgMzUgMzYgMzcgMzggMzkgMzAg
MzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjAwZjAgIDMwIDMx
IDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAx
MjM0NQowMTAwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAz
MSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDExMCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEg
MzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjAxMjAgIDM4IDM5IDMwIDMxIDMy
IDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowMTMw
ICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4
OTAxMjM0NTY3ODkKMDE0MCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIg
MzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjAxNTAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMz
IDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQowMTYwICAzMiAzMyAz
NCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1
NjcKMDE3MCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMg
ICA4OTAxMjM0NTY3ODkwMTIzCjAxODAgIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0
IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowMTkwICAzMCAzMSAzMiAzMyAzNCAz
NSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDFhMCAg
MzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEy
MzQ1Njc4OTAxCjAxYjAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1
IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowMWMwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAz
NiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDFkMCAgMzQgMzUgMzYg
MzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5
CjAxZTAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAg
MDEyMzQ1Njc4OTAxMjM0NQowMWYwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAz
NyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDIwMCAgMzIgMzMgMzQgMzUgMzYgMzcg
MzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjAyMTAgIDM4
IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2
Nzg5MDEyMwowMjIwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAz
OCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDIzMCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzgg
MzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjAyNDAgIDM2IDM3IDM4IDM5
IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQow
MjUwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIz
NDU2Nzg5MDEyMzQ1NjcKMDI2MCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkg
MzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjAyNzAgIDM0IDM1IDM2IDM3IDM4IDM5IDMw
IDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowMjgwICAzMCAz
MSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkw
MTIzNDUKMDI5MCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAg
MzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjAyYTAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMx
IDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowMmIwICAzOCAzOSAzMCAzMSAz
MiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDJj
MCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3
ODkwMTIzNDU2Nzg5CjAyZDAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMy
IDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowMmUwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAz
MyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDJmMCAgMzIgMzMg
MzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0
NTY3CjAzMDAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMz
ICAgODkwMTIzNDU2Nzg5MDEyMwowMzEwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAz
NCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDMyMCAgMzAgMzEgMzIgMzMgMzQg
MzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjAzMzAg
IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAx
MjM0NTY3ODkwMQowMzQwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAz
NSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDM1MCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUg
MzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjAzNjAgIDM0IDM1IDM2
IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4
OQowMzcwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAg
IDAxMjM0NTY3ODkwMTIzNDUKMDM4MCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYg
MzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjAzOTAgIDMyIDMzIDM0IDM1IDM2IDM3
IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowM2EwICAz
OCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1
Njc4OTAxMjMKMDNiMCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcg
MzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjAzYzAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4
IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowM2QwICAzNiAzNyAzOCAz
OSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEK
MDNlMCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAy
MzQ1Njc4OTAxMjM0NTY3CjAzZjAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5
IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowNDAwICAzNCAzNSAzNiAzNyAzOCAzOSAz
MCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDQxMCAgMzAg
MzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5
MDEyMzQ1CjA0MjAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMw
IDMxICAgNjc4OTAxMjM0NTY3ODkwMQowNDMwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAz
MSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDQ0MCAgMzggMzkgMzAgMzEg
MzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjA0
NTAgIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2
Nzg5MDEyMzQ1Njc4OQowNDYwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAz
MiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDQ3MCAgMzYgMzcgMzggMzkgMzAgMzEgMzIg
MzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjA0ODAgIDMyIDMz
IDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIz
NDU2NwowNDkwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAz
MyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDRhMCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMg
MzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjA0YjAgIDMwIDMxIDMyIDMzIDM0
IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowNGMw
ICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkw
MTIzNDU2Nzg5MDEKMDRkMCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQg
MzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjA0ZTAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1
IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowNGYwICAzNCAzNSAz
NiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3
ODkKMDUwMCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUg
ICAwMTIzNDU2Nzg5MDEyMzQ1CjA1MTAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2
IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQowNTIwICAzMiAzMyAzNCAzNSAzNiAz
NyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDUzMCAg
MzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0
NTY3ODkwMTIzCjA1NDAgIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3
IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowNTUwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAz
OCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDU2MCAgMzYgMzcgMzgg
MzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAx
CjA1NzAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAg
MjM0NTY3ODkwMTIzNDU2NwowNTgwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAz
OSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDU5MCAgMzQgMzUgMzYgMzcgMzggMzkg
MzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjA1YTAgIDMw
IDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgICAgICAgICAgICAgICAgICAgICAgICAgMDEyMzQ1NjcK
ICAgICAgICAgICAgRGF0YTogMzAzMTMyMzMzNDM1MzYzNzM4MzkzMDMxMzIzMzM0MzUzNjM3Mzgz
OTMwMzEzMjMzLi4uCiAgICAgICAgICAgIFtMZW5ndGg6IDE0NDhdCiAgICBBLU1TRFUgU3ViZnJh
bWUgIzIKICAgICAgICBEZXN0aW5hdGlvbiBhZGRyZXNzOiBJbnRlbF81ZTpiZDo4NSAoMDA6MGU6
MGM6NWU6YmQ6ODUpCiAgICAgICAgU291cmNlIGFkZHJlc3M6IEFwcGxlXzY3OjI0OjU0ICg4NDoz
ODozNTo2NzoyNDo1NCkKICAgICAgICBBLU1TRFUgTGVuZ3RoOiAxNTA4CiAgICAgICAgTG9naWNh
bC1MaW5rIENvbnRyb2wKICAgICAgICAgICAgRFNBUDogU05BUCAoMHhhYSkKICAgICAgICAgICAg
SUcgQml0OiBJbmRpdmlkdWFsCiAgICAgICAgICAgIFNTQVA6IFNOQVAgKDB4YWEpCiAgICAgICAg
ICAgIENSIEJpdDogQ29tbWFuZAogICAgICAgICAgICBDb250cm9sIGZpZWxkOiBVLCBmdW5jPVVJ
ICgweDAzKQogICAgICAgICAgICAgICAgMDAwLiAwMC4uID0gQ29tbWFuZDogVW5udW1iZXJlZCBJ
bmZvcm1hdGlvbiAoMHgwMCkKICAgICAgICAgICAgICAgIC4uLi4gLi4xMSA9IEZyYW1lIHR5cGU6
IFVubnVtYmVyZWQgZnJhbWUgKDB4MDMpCiAgICAgICAgICAgIE9yZ2FuaXphdGlvbiBDb2RlOiBF
bmNhcHN1bGF0ZWQgRXRoZXJuZXQgKDB4MDAwMDAwKQogICAgICAgICAgICBUeXBlOiBJUCAoMHgw
ODAwKQogICAgICAgIEludGVybmV0IFByb3RvY29sIFZlcnNpb24gNCwgU3JjOiAxOTIuMTY4LjI1
NC41MiAoMTkyLjE2OC4yNTQuNTIpLCBEc3Q6IDE5Mi4xNjguMjU0LjEgKDE5Mi4xNjguMjU0LjEp
CiAgICAgICAgICAgIFZlcnNpb246IDQKICAgICAgICAgICAgSGVhZGVyIGxlbmd0aDogMjAgYnl0
ZXMKICAgICAgICAgICAgRGlmZmVyZW50aWF0ZWQgU2VydmljZXMgRmllbGQ6IDB4MDAgKERTQ1Ag
MHgwMDogRGVmYXVsdDsgRUNOOiAweDAwOiBOb3QtRUNUIChOb3QgRUNOLUNhcGFibGUgVHJhbnNw
b3J0KSkKICAgICAgICAgICAgICAgIDAwMDAgMDAuLiA9IERpZmZlcmVudGlhdGVkIFNlcnZpY2Vz
IENvZGVwb2ludDogRGVmYXVsdCAoMHgwMCkKICAgICAgICAgICAgICAgIC4uLi4gLi4wMCA9IEV4
cGxpY2l0IENvbmdlc3Rpb24gTm90aWZpY2F0aW9uOiBOb3QtRUNUIChOb3QgRUNOLUNhcGFibGUg
VHJhbnNwb3J0KSAoMHgwMCkKICAgICAgICAgICAgVG90YWwgTGVuZ3RoOiAxNTAwCiAgICAgICAg
ICAgIElkZW50aWZpY2F0aW9uOiAweGMxMjcgKDQ5NDQ3KQogICAgICAgICAgICBGbGFnczogMHgw
MiAoRG9uJ3QgRnJhZ21lbnQpCiAgICAgICAgICAgICAgICAwLi4uIC4uLi4gPSBSZXNlcnZlZCBi
aXQ6IE5vdCBzZXQKICAgICAgICAgICAgICAgIC4xLi4gLi4uLiA9IERvbid0IGZyYWdtZW50OiBT
ZXQKICAgICAgICAgICAgICAgIC4uMC4gLi4uLiA9IE1vcmUgZnJhZ21lbnRzOiBOb3Qgc2V0CiAg
ICAgICAgICAgIEZyYWdtZW50IG9mZnNldDogMAogICAgICAgICAgICBUaW1lIHRvIGxpdmU6IDY0
CiAgICAgICAgICAgIFByb3RvY29sOiBUQ1AgKDYpCiAgICAgICAgICAgIEhlYWRlciBjaGVja3N1
bTogMHhmNjZjIFtjb3JyZWN0XQogICAgICAgICAgICAgICAgW0dvb2Q6IFRydWVdCiAgICAgICAg
ICAgICAgICBbQmFkOiBGYWxzZV0KICAgICAgICAgICAgU291cmNlOiAxOTIuMTY4LjI1NC41MiAo
MTkyLjE2OC4yNTQuNTIpCiAgICAgICAgICAgIERlc3RpbmF0aW9uOiAxOTIuMTY4LjI1NC4xICgx
OTIuMTY4LjI1NC4xKQogICAgICAgICAgICBbU291cmNlIEdlb0lQOiBVbmtub3duXQogICAgICAg
ICAgICBbRGVzdGluYXRpb24gR2VvSVA6IFVua25vd25dCiAgICAgICAgVHJhbnNtaXNzaW9uIENv
bnRyb2wgUHJvdG9jb2wsIFNyYyBQb3J0OiA1MjczNCAoNTI3MzQpLCBEc3QgUG9ydDogNTAwMSAo
NTAwMSksIFNlcTogMzA2Njg4OSwgQWNrOiAxLCBMZW46IDE0NDgKICAgICAgICAgICAgU291cmNl
IHBvcnQ6IDUyNzM0ICg1MjczNCkKICAgICAgICAgICAgRGVzdGluYXRpb24gcG9ydDogNTAwMSAo
NTAwMSkKICAgICAgICAgICAgW1N0cmVhbSBpbmRleDogMF0KICAgICAgICAgICAgU2VxdWVuY2Ug
bnVtYmVyOiAzMDY2ODg5ICAgIChyZWxhdGl2ZSBzZXF1ZW5jZSBudW1iZXIpCiAgICAgICAgICAg
IFtOZXh0IHNlcXVlbmNlIG51bWJlcjogMzA2ODMzNyAgICAocmVsYXRpdmUgc2VxdWVuY2UgbnVt
YmVyKV0KICAgICAgICAgICAgQWNrbm93bGVkZ21lbnQgbnVtYmVyOiAxICAgIChyZWxhdGl2ZSBh
Y2sgbnVtYmVyKQogICAgICAgICAgICBIZWFkZXIgbGVuZ3RoOiAzMiBieXRlcwogICAgICAgICAg
ICBGbGFnczogMHgwMTAgKEFDSykKICAgICAgICAgICAgICAgIDAwMC4gLi4uLiAuLi4uID0gUmVz
ZXJ2ZWQ6IE5vdCBzZXQKICAgICAgICAgICAgICAgIC4uLjAgLi4uLiAuLi4uID0gTm9uY2U6IE5v
dCBzZXQKICAgICAgICAgICAgICAgIC4uLi4gMC4uLiAuLi4uID0gQ29uZ2VzdGlvbiBXaW5kb3cg
UmVkdWNlZCAoQ1dSKTogTm90IHNldAogICAgICAgICAgICAgICAgLi4uLiAuMC4uIC4uLi4gPSBF
Q04tRWNobzogTm90IHNldAogICAgICAgICAgICAgICAgLi4uLiAuLjAuIC4uLi4gPSBVcmdlbnQ6
IE5vdCBzZXQKICAgICAgICAgICAgICAgIC4uLi4gLi4uMSAuLi4uID0gQWNrbm93bGVkZ21lbnQ6
IFNldAogICAgICAgICAgICAgICAgLi4uLiAuLi4uIDAuLi4gPSBQdXNoOiBOb3Qgc2V0CiAgICAg
ICAgICAgICAgICAuLi4uIC4uLi4gLjAuLiA9IFJlc2V0OiBOb3Qgc2V0CiAgICAgICAgICAgICAg
ICAuLi4uIC4uLi4gLi4wLiA9IFN5bjogTm90IHNldAogICAgICAgICAgICAgICAgLi4uLiAuLi4u
IC4uLjAgPSBGaW46IE5vdCBzZXQKICAgICAgICAgICAgV2luZG93IHNpemUgdmFsdWU6IDgyMzUK
ICAgICAgICAgICAgW0NhbGN1bGF0ZWQgd2luZG93IHNpemU6IDEzMTc2MF0KICAgICAgICAgICAg
W1dpbmRvdyBzaXplIHNjYWxpbmcgZmFjdG9yOiAxNl0KICAgICAgICAgICAgQ2hlY2tzdW06IDB4
MTNjOCBbaW5jb3JyZWN0LCBzaG91bGQgYmUgMHhlODkxIChtYXliZSBjYXVzZWQgYnkgIlRDUCBj
aGVja3N1bSBvZmZsb2FkIj8pXQogICAgICAgICAgICAgICAgW0dvb2QgQ2hlY2tzdW06IEZhbHNl
XQogICAgICAgICAgICAgICAgW0JhZCBDaGVja3N1bTogVHJ1ZV0KICAgICAgICAgICAgICAgICAg
ICBbRXhwZXJ0IEluZm8gKEVycm9yL0NoZWNrc3VtKTogQmFkIGNoZWNrc3VtXQogICAgICAgICAg
ICAgICAgICAgICAgICBbTWVzc2FnZTogQmFkIGNoZWNrc3VtXQogICAgICAgICAgICAgICAgICAg
ICAgICBbU2V2ZXJpdHkgbGV2ZWw6IEVycm9yXQogICAgICAgICAgICAgICAgICAgICAgICBbR3Jv
dXA6IENoZWNrc3VtXQogICAgICAgICAgICBPcHRpb25zOiAoMTIgYnl0ZXMpLCBOby1PcGVyYXRp
b24gKE5PUCksIE5vLU9wZXJhdGlvbiAoTk9QKSwgVGltZXN0YW1wcwogICAgICAgICAgICAgICAg
Tm8tT3BlcmF0aW9uIChOT1ApCiAgICAgICAgICAgICAgICAgICAgVHlwZTogMQogICAgICAgICAg
ICAgICAgICAgICAgICAwLi4uIC4uLi4gPSBDb3B5IG9uIGZyYWdtZW50YXRpb246IE5vCiAgICAg
ICAgICAgICAgICAgICAgICAgIC4wMC4gLi4uLiA9IENsYXNzOiBDb250cm9sICgwKQogICAgICAg
ICAgICAgICAgICAgICAgICAuLi4wIDAwMDEgPSBOdW1iZXI6IE5vLU9wZXJhdGlvbiAoTk9QKSAo
MSkKICAgICAgICAgICAgICAgIE5vLU9wZXJhdGlvbiAoTk9QKQogICAgICAgICAgICAgICAgICAg
IFR5cGU6IDEKICAgICAgICAgICAgICAgICAgICAgICAgMC4uLiAuLi4uID0gQ29weSBvbiBmcmFn
bWVudGF0aW9uOiBObwogICAgICAgICAgICAgICAgICAgICAgICAuMDAuIC4uLi4gPSBDbGFzczog
Q29udHJvbCAoMCkKICAgICAgICAgICAgICAgICAgICAgICAgLi4uMCAwMDAxID0gTnVtYmVyOiBO
by1PcGVyYXRpb24gKE5PUCkgKDEpCiAgICAgICAgICAgICAgICBUaW1lc3RhbXBzOiBUU3ZhbCAx
MzAyNTE0MDExLCBUU2VjciAzMjg3NDY1ODIKICAgICAgICAgICAgICAgICAgICBLaW5kOiBUaW1l
c3RhbXAgKDgpCiAgICAgICAgICAgICAgICAgICAgTGVuZ3RoOiAxMAogICAgICAgICAgICAgICAg
ICAgIFRpbWVzdGFtcCB2YWx1ZTogMTMwMjUxNDAxMQogICAgICAgICAgICAgICAgICAgIFRpbWVz
dGFtcCBlY2hvIHJlcGx5OiAzMjg3NDY1ODIKICAgICAgICBEYXRhICgxNDQ4IGJ5dGVzKQoKMDAw
MCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAx
MjM0NTY3ODkwMTIzCjAwMTAgIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2
IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowMDIwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAz
NyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDAzMCAgMzYgMzcg
MzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4
OTAxCjAwNDAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3
ICAgMjM0NTY3ODkwMTIzNDU2NwowMDUwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAz
OCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDA2MCAgMzQgMzUgMzYgMzcgMzgg
MzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjAwNzAg
IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1
Njc4OTAxMjM0NQowMDgwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAz
OSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDA5MCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkg
MzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjAwYTAgIDM4IDM5IDMw
IDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEy
MwowMGIwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAg
IDQ1Njc4OTAxMjM0NTY3ODkKMDBjMCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAg
MzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjAwZDAgIDM2IDM3IDM4IDM5IDMwIDMx
IDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQowMGUwICAz
MiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5
MDEyMzQ1NjcKMDBmMCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEg
MzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjAxMDAgIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMy
IDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowMTEwICAzMCAzMSAzMiAz
MyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUK
MDEyMCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2
Nzg5MDEyMzQ1Njc4OTAxCjAxMzAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMz
IDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowMTQwICAzOCAzOSAzMCAzMSAzMiAzMyAz
NCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDE1MCAgMzQg
MzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIz
NDU2Nzg5CjAxNjAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0
IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowMTcwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAz
NSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDE4MCAgMzIgMzMgMzQgMzUg
MzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjAx
OTAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkw
MTIzNDU2Nzg5MDEyMwowMWEwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAz
NiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDFiMCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYg
MzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjAxYzAgIDM2IDM3
IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3
ODkwMQowMWQwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAz
NyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDFlMCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcg
MzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjAxZjAgIDM0IDM1IDM2IDM3IDM4
IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowMjAw
ICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0
NTY3ODkwMTIzNDUKMDIxMCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzgg
MzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjAyMjAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5
IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowMjMwICAzOCAzOSAz
MCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAx
MjMKMDI0MCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkg
ICA0NTY3ODkwMTIzNDU2Nzg5CjAyNTAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMw
IDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowMjYwICAzNiAzNyAzOCAzOSAzMCAz
MSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDI3MCAg
MzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4
OTAxMjM0NTY3CjAyODAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMx
IDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowMjkwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAz
MiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDJhMCAgMzAgMzEgMzIg
MzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1
CjAyYjAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAg
Njc4OTAxMjM0NTY3ODkwMQowMmMwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAz
MyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDJkMCAgMzggMzkgMzAgMzEgMzIgMzMg
MzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjAyZTAgIDM0
IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEy
MzQ1Njc4OQowMmYwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAz
NCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDMwMCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQg
MzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjAzMTAgIDMyIDMzIDM0IDM1
IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2Nwow
MzIwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5
MDEyMzQ1Njc4OTAxMjMKMDMzMCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUg
MzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjAzNDAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2
IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowMzUwICAzNiAz
NyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2
Nzg5MDEKMDM2MCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYg
MzcgICAyMzQ1Njc4OTAxMjM0NTY3CjAzNzAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3
IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowMzgwICAzNCAzNSAzNiAzNyAz
OCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDM5
MCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIz
NDU2Nzg5MDEyMzQ1CjAzYTAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4
IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQowM2IwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAz
OSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDNjMCAgMzggMzkg
MzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkw
MTIzCjAzZDAgIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5
ICAgNDU2Nzg5MDEyMzQ1Njc4OQowM2UwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAz
MCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDNmMCAgMzYgMzcgMzggMzkgMzAg
MzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjA0MDAg
IDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDI2IDY3IDc0IDI1IDI3IDY3ICAgMjM0NTY3
ODkwMSZndCUnZwowNDEwICAzOSAyOCAzMSAyNCAzNiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAz
MSAzMiAzMyAgIDkoMSQ2MzQ1Njc4OTAxMjMKMDQyMCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEg
MzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjA0MzAgIDMwIDMxIDMy
IDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0
NQowNDQwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAg
IDY3ODkwMTIzNDU2Nzg5MDEKMDQ1MCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIg
MzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjA0NjAgIDM4IDM5IDMwIDMxIDMyIDMz
IDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowNDcwICAz
NCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAx
MjM0NTY3ODkKMDQ4MCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMg
MzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjA0OTAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0
IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQowNGEwICAzMiAzMyAzNCAz
NSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcK
MDRiMCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4
OTAxMjM0NTY3ODkwMTIzCjA0YzAgIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1
IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowNGQwICAzMCAzMSAzMiAzMyAzNCAzNSAz
NiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDRlMCAgMzYg
MzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1
Njc4OTAxCjA0ZjAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2
IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowNTAwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAz
NyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDUxMCAgMzQgMzUgMzYgMzcg
MzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjA1
MjAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEy
MzQ1Njc4OTAxMjM0NQowNTMwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAz
OCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDU0MCAgMzIgMzMgMzQgMzUgMzYgMzcgMzgg
MzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjA1NTAgIDM4IDM5
IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5
MDEyMwowNTYwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAz
OSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDU3MCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkg
MzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjA1ODAgIDM2IDM3IDM4IDM5IDMw
IDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQowNTkw
ICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2
Nzg5MDEyMzQ1NjcKMDVhMCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAgICAgICAgICAgICAg
ICAgICAgICAgICA4OTAxMjM0NQogICAgICAgICAgICBEYXRhOiAzODM5MzAzMTMyMzMzNDM1MzYz
NzM4MzkzMDMxMzIzMzM0MzUzNjM3MzgzOTMwMzEuLi4KICAgICAgICAgICAgW0xlbmd0aDogMTQ0
OF0KCk5vLiAgICAgVGltZSAgICAgICAgU291cmNlICAgICAgICAgICAgICAgIERlc3RpbmF0aW9u
ICAgICAgICAgICBQcm90b2NvbCBMZW5ndGggSW5mbwogICA1NTU2IDE1LjYwOTIwMyAgIDE5Mi4x
NjguMjU0LjUyICAgICAgICAxOTIuMTY4LjI1NC4xICAgICAgICAgVENQICAgICAgMzExMCAgIDUy
NzM0ID4gNTAwMSBbQUNLXSBTZXE9MzA2Njg4OSBBY2s9MSBXaW49MTMxNzYwIExlbj0xNDQ4IFRT
dmFsPTEzMDI1MTQwMTEgVFNlY3I9MzI4NzQ2NTgyCgpGcmFtZSA1NTU2OiAzMTEwIGJ5dGVzIG9u
IHdpcmUgKDI0ODgwIGJpdHMpLCAzMTEwIGJ5dGVzIGNhcHR1cmVkICgyNDg4MCBiaXRzKQogICAg
RW5jYXBzdWxhdGlvbiB0eXBlOiBJRUVFIDgwMi4xMSBwbHVzIHJhZGlvdGFwIHJhZGlvIGhlYWRl
ciAoMjMpCiAgICBBcnJpdmFsIFRpbWU6IEp1bCAgOCwgMjAxNCAxMToyNDozOS4wODI5NTcwMDAg
UERUCiAgICBbVGltZSBzaGlmdCBmb3IgdGhpcyBwYWNrZXQ6IDAuMDAwMDAwMDAwIHNlY29uZHNd
CiAgICBFcG9jaCBUaW1lOiAxNDA0ODQzODc5LjA4Mjk1NzAwMCBzZWNvbmRzCiAgICBbVGltZSBk
ZWx0YSBmcm9tIHByZXZpb3VzIGNhcHR1cmVkIGZyYW1lOiAwLjAwMDA2NjAwMCBzZWNvbmRzXQog
ICAgW1RpbWUgZGVsdGEgZnJvbSBwcmV2aW91cyBkaXNwbGF5ZWQgZnJhbWU6IDAuMDAwMDY2MDAw
IHNlY29uZHNdCiAgICBbVGltZSBzaW5jZSByZWZlcmVuY2Ugb3IgZmlyc3QgZnJhbWU6IDE1LjYw
OTIwMzAwMCBzZWNvbmRzXQogICAgRnJhbWUgTnVtYmVyOiA1NTU2CiAgICBGcmFtZSBMZW5ndGg6
IDMxMTAgYnl0ZXMgKDI0ODgwIGJpdHMpCiAgICBDYXB0dXJlIExlbmd0aDogMzExMCBieXRlcyAo
MjQ4ODAgYml0cykKICAgIFtGcmFtZSBpcyBtYXJrZWQ6IFRydWVdCiAgICBbRnJhbWUgaXMgaWdu
b3JlZDogRmFsc2VdCiAgICBbUHJvdG9jb2xzIGluIGZyYW1lOiByYWRpb3RhcDp3bGFuOmxsYzpp
cDp0Y3A6ZGF0YTpsbGM6aXA6dGNwOmRhdGFdCiAgICBbQ29sb3JpbmcgUnVsZSBOYW1lOiBUQ1Bd
CiAgICBbQ29sb3JpbmcgUnVsZSBTdHJpbmc6IHRjcF0KUmFkaW90YXAgSGVhZGVyIHYwLCBMZW5n
dGggMzgKICAgIEhlYWRlciByZXZpc2lvbjogMAogICAgSGVhZGVyIHBhZDogMAogICAgSGVhZGVy
IGxlbmd0aDogMzgKICAgIFByZXNlbnQgZmxhZ3MKICAgICAgICAuLi4uIC4uLi4gLi4uLiAuLi4u
IC4uLi4gLi4uLiAuLi4uIC4uLjEgPSBUU0ZUOiBUcnVlCiAgICAgICAgLi4uLiAuLi4uIC4uLi4g
Li4uLiAuLi4uIC4uLi4gLi4uLiAuLjEuID0gRmxhZ3M6IFRydWUKICAgICAgICAuLi4uIC4uLi4g
Li4uLiAuLi4uIC4uLi4gLi4uLiAuLi4uIC4wLi4gPSBSYXRlOiBGYWxzZQogICAgICAgIC4uLi4g
Li4uLiAuLi4uIC4uLi4gLi4uLiAuLi4uIC4uLi4gMS4uLiA9IENoYW5uZWw6IFRydWUKICAgICAg
ICAuLi4uIC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4uLiAuLi4wIC4uLi4gPSBGSFNTOiBGYWxzZQog
ICAgICAgIC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4uLiAuLi4uIC4uMS4gLi4uLiA9IGRCbSBBbnRl
bm5hIFNpZ25hbDogVHJ1ZQogICAgICAgIC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4uLiAuLi4uIC4w
Li4gLi4uLiA9IGRCbSBBbnRlbm5hIE5vaXNlOiBGYWxzZQogICAgICAgIC4uLi4gLi4uLiAuLi4u
IC4uLi4gLi4uLiAuLi4uIDAuLi4gLi4uLiA9IExvY2sgUXVhbGl0eTogRmFsc2UKICAgICAgICAu
Li4uIC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4uMCAuLi4uIC4uLi4gPSBUWCBBdHRlbnVhdGlvbjog
RmFsc2UKICAgICAgICAuLi4uIC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4wLiAuLi4uIC4uLi4gPSBk
QiBUWCBBdHRlbnVhdGlvbjogRmFsc2UKICAgICAgICAuLi4uIC4uLi4gLi4uLiAuLi4uIC4uLi4g
LjAuLiAuLi4uIC4uLi4gPSBkQm0gVFggUG93ZXI6IEZhbHNlCiAgICAgICAgLi4uLiAuLi4uIC4u
Li4gLi4uLiAuLi4uIDEuLi4gLi4uLiAuLi4uID0gQW50ZW5uYTogVHJ1ZQogICAgICAgIC4uLi4g
Li4uLiAuLi4uIC4uLi4gLi4uMCAuLi4uIC4uLi4gLi4uLiA9IGRCIEFudGVubmEgU2lnbmFsOiBG
YWxzZQogICAgICAgIC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4wLiAuLi4uIC4uLi4gLi4uLiA9IGRC
IEFudGVubmEgTm9pc2U6IEZhbHNlCiAgICAgICAgLi4uLiAuLi4uIC4uLi4gLi4uLiAuMS4uIC4u
Li4gLi4uLiAuLi4uID0gUlggZmxhZ3M6IFRydWUKICAgICAgICAuLi4uIC4uLi4gLi4uLiAuMC4u
IC4uLi4gLi4uLiAuLi4uIC4uLi4gPSBDaGFubmVsKzogRmFsc2UKICAgICAgICAuLi4uIC4uLi4g
Li4uLiAwLi4uIC4uLi4gLi4uLiAuLi4uIC4uLi4gPSBIVCBpbmZvcm1hdGlvbjogRmFsc2UKICAg
ICAgICAuLi4uIC4uLi4gLi4uMCAuLi4uIC4uLi4gLi4uLiAuLi4uIC4uLi4gPSBBLU1QRFUgU3Rh
dHVzOiBGYWxzZQogICAgICAgIC4uLi4gLi4uLiAuLjEuIC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4u
LiA9IFZIVCBpbmZvcm1hdGlvbjogVHJ1ZQogICAgICAgIC4uLjAgMDAwMCAwMC4uIC4uLi4gLi4u
LiAuLi4uIC4uLi4gLi4uLiA9IFJlc2VydmVkOiAweDAwMDAwMDAwCiAgICAgICAgLi4wLiAuLi4u
IC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4uLiAuLi4uID0gUmFkaW90YXAgTlMgbmV4dDogRmFsc2UK
ICAgICAgICAuMC4uIC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4uLiAuLi4uIC4uLi4gPSBWZW5kb3Ig
TlMgbmV4dDogRmFsc2UKICAgICAgICAwLi4uIC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4uLiAuLi4u
IC4uLi4gPSBFeHQ6IEZhbHNlCiAgICBNQUMgdGltZXN0YW1wOiAxMzk1NTQyNjY0CiAgICBGbGFn
czogMHgwMAogICAgICAgIC4uLi4gLi4uMCA9IENGUDogRmFsc2UKICAgICAgICAuLi4uIC4uMC4g
PSBQcmVhbWJsZTogTG9uZwogICAgICAgIC4uLi4gLjAuLiA9IFdFUDogRmFsc2UKICAgICAgICAu
Li4uIDAuLi4gPSBGcmFnbWVudGF0aW9uOiBGYWxzZQogICAgICAgIC4uLjAgLi4uLiA9IEZDUyBh
dCBlbmQ6IEZhbHNlCiAgICAgICAgLi4wLiAuLi4uID0gRGF0YSBQYWQ6IEZhbHNlCiAgICAgICAg
LjAuLiAuLi4uID0gQmFkIEZDUzogRmFsc2UKICAgICAgICAwLi4uIC4uLi4gPSBTaG9ydCBHSTog
RmFsc2UKICAgIENoYW5uZWwgZnJlcXVlbmN5OiA1NzQ1IFtBIDE0OV0KICAgIENoYW5uZWwgdHlw
ZTogODAyLjExYSAoMHgwMTQwKQogICAgICAgIC4uLi4gLi4uLiAuLi4wIC4uLi4gPSBUdXJibzog
RmFsc2UKICAgICAgICAuLi4uIC4uLi4gLi4wLiAuLi4uID0gQ29tcGxlbWVudGFyeSBDb2RlIEtl
eWluZyAoQ0NLKTogRmFsc2UKICAgICAgICAuLi4uIC4uLi4gLjEuLiAuLi4uID0gT3J0aG9nb25h
bCBGcmVxdWVuY3ktRGl2aXNpb24gTXVsdGlwbGV4aW5nIChPRkRNKTogVHJ1ZQogICAgICAgIC4u
Li4gLi4uLiAwLi4uIC4uLi4gPSAyIEdIeiBzcGVjdHJ1bTogRmFsc2UKICAgICAgICAuLi4uIC4u
LjEgLi4uLiAuLi4uID0gNSBHSHogc3BlY3RydW06IFRydWUKICAgICAgICAuLi4uIC4uMC4gLi4u
LiAuLi4uID0gUGFzc2l2ZTogRmFsc2UKICAgICAgICAuLi4uIC4wLi4gLi4uLiAuLi4uID0gRHlu
YW1pYyBDQ0stT0ZETTogRmFsc2UKICAgICAgICAuLi4uIDAuLi4gLi4uLiAuLi4uID0gR2F1c3Np
YW4gRnJlcXVlbmN5IFNoaWZ0IEtleWluZyAoR0ZTSyk6IEZhbHNlCiAgICAgICAgLi4uMCAuLi4u
IC4uLi4gLi4uLiA9IEdTTSAoOTAwTUh6KTogRmFsc2UKICAgICAgICAuLjAuIC4uLi4gLi4uLiAu
Li4uID0gU3RhdGljIFR1cmJvOiBGYWxzZQogICAgICAgIC4wLi4gLi4uLiAuLi4uIC4uLi4gPSBI
YWxmIFJhdGUgQ2hhbm5lbCAoMTBNSHogQ2hhbm5lbCBXaWR0aCk6IEZhbHNlCiAgICAgICAgMC4u
LiAuLi4uIC4uLi4gLi4uLiA9IFF1YXJ0ZXIgUmF0ZSBDaGFubmVsICg1TUh6IENoYW5uZWwgV2lk
dGgpOiBGYWxzZQogICAgU1NJIFNpZ25hbDogLTQ2IGRCbQogICAgQW50ZW5uYTogMAogICAgUlgg
ZmxhZ3M6IDB4MDAwMAogICAgICAgIC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4uLiAuLjAuID0gQmFk
IFBMQ1A6IEZhbHNlCiAgICBWSFQgaW5mb3JtYXRpb24KICAgICAgICBLbm93biBWSFQgaW5mb3Jt
YXRpb246IDB4NDQKICAgICAgICAgICAgLi4uLiAuLi4uIC4uLi4gLi4uMCA9IFNUQkM6IEZhbHNl
CiAgICAgICAgICAgIC4uLi4gLi4uLiAuLi4uIC4uMC4gPSBUWE9QX1BTX05PVF9BTExPV0VEOiBG
YWxzZQogICAgICAgICAgICAuLi4uIC4uLi4gLi4uLiAuMS4uID0gR3VhcmQgaW50ZXJ2YWw6IFRy
dWUKICAgICAgICAgICAgLi4uLiAuLi4uIC4uLi4gMC4uLiA9IFNHSSBOc3ltIGRpc2FtYmlndWF0
aW9uOiBGYWxzZQogICAgICAgICAgICAuLi4uIC4uLi4gLi4uMCAuLi4uID0gTERQQyBleHRyYSBP
RkRNIHN5bWJvbDogRmFsc2UKICAgICAgICAgICAgLi4uLiAuLi4uIC4uMC4gLi4uLiA9IEJlYW1m
b3JtZWQ6IEZhbHNlCiAgICAgICAgICAgIC4uLi4gLi4uLiAuMS4uIC4uLi4gPSBCYW5kd2lkdGg6
IFRydWUKICAgICAgICAgICAgLi4uLiAuLi4uIDAuLi4gLi4uLiA9IEdyb3VwIElEOiBGYWxzZQog
ICAgICAgICAgICAuLi4uIC4uLjAgLi4uLiAuLi4uID0gUGFydGlhbCBBSUQ6IEZhbHNlCiAgICAg
ICAgLi4uLiAuMC4uID0gR3VhcmQgaW50ZXJ2YWw6IGxvbmcgKDApCiAgICAgICAgQmFuZHdpZHRo
OiA4MCBNSHogKDQpCiAgICAgICAgVXNlciAwOiBNQ1MgOQogICAgICAgICAgICAxMDAxIC4uLi4g
PSBNQ1MgaW5kZXggMDogOSAoMjU2LVFBTSA1LzYpCiAgICAgICAgICAgIC4uLi4gMDAxMCA9IFNw
YXRpYWwgc3RyZWFtcyAwOiAyCiAgICAgICAgICAgIFNwYWNlLXRpbWUgc3RyZWFtcyAwOiAyCiAg
ICAgICAgICAgIENvZGluZyAwOiBCQ0MgKDApCiAgICAgICAgICAgIFtEYXRhIFJhdGU6IDc4MC4w
IE1iL3NdCklFRUUgODAyLjExIFFvUyBEYXRhLCBGbGFnczogLi4uLlIuLlQKICAgIFR5cGUvU3Vi
dHlwZTogUW9TIERhdGEgKDB4MjgpCiAgICBGcmFtZSBDb250cm9sIEZpZWxkOiAweDg4MDkKICAg
ICAgICAuLi4uIC4uMDAgPSBWZXJzaW9uOiAwCiAgICAgICAgLi4uLiAxMC4uID0gVHlwZTogRGF0
YSBmcmFtZSAoMikKICAgICAgICAxMDAwIC4uLi4gPSBTdWJ0eXBlOiA4CiAgICAgICAgRmxhZ3M6
IDB4MDkKICAgICAgICAgICAgLi4uLiAuLjAxID0gRFMgc3RhdHVzOiBGcmFtZSBmcm9tIFNUQSB0
byBEUyB2aWEgYW4gQVAgKFRvIERTOiAxIEZyb20gRFM6IDApICgweDAxKQogICAgICAgICAgICAu
Li4uIC4wLi4gPSBNb3JlIEZyYWdtZW50czogVGhpcyBpcyB0aGUgbGFzdCBmcmFnbWVudAogICAg
ICAgICAgICAuLi4uIDEuLi4gPSBSZXRyeTogRnJhbWUgaXMgYmVpbmcgcmV0cmFuc21pdHRlZAog
ICAgICAgICAgICAgICAgW0V4cGVydCBJbmZvIChOb3RlL1NlcXVlbmNlKTogUmV0cmFuc21pc3Np
b24gKHJldHJ5KV0KICAgICAgICAgICAgICAgICAgICBbTWVzc2FnZTogUmV0cmFuc21pc3Npb24g
KHJldHJ5KV0KICAgICAgICAgICAgICAgICAgICBbU2V2ZXJpdHkgbGV2ZWw6IE5vdGVdCiAgICAg
ICAgICAgICAgICAgICAgW0dyb3VwOiBTZXF1ZW5jZV0KICAgICAgICAgICAgLi4uMCAuLi4uID0g
UFdSIE1HVDogU1RBIHdpbGwgc3RheSB1cAogICAgICAgICAgICAuLjAuIC4uLi4gPSBNb3JlIERh
dGE6IE5vIGRhdGEgYnVmZmVyZWQKICAgICAgICAgICAgLjAuLiAuLi4uID0gUHJvdGVjdGVkIGZs
YWc6IERhdGEgaXMgbm90IHByb3RlY3RlZAogICAgICAgICAgICAwLi4uIC4uLi4gPSBPcmRlciBm
bGFnOiBOb3Qgc3RyaWN0bHkgb3JkZXJlZAogICAgLjAwMCAwMDAwIDAwMTEgMDAwMCA9IER1cmF0
aW9uOiA0OCBtaWNyb3NlY29uZHMKICAgIFJlY2VpdmVyIGFkZHJlc3M6IFNlbmFvTmV0XzE4OmE3
OmQwICg4ODpkYzo5NjoxODphNzpkMCkKICAgIEJTUyBJZDogU2VuYW9OZXRfMTg6YTc6ZDAgKDg4
OmRjOjk2OjE4OmE3OmQwKQogICAgVHJhbnNtaXR0ZXIgYWRkcmVzczogQXBwbGVfNjc6MjQ6NTQg
KDg0OjM4OjM1OjY3OjI0OjU0KQogICAgU291cmNlIGFkZHJlc3M6IEFwcGxlXzY3OjI0OjU0ICg4
NDozODozNTo2NzoyNDo1NCkKICAgIERlc3RpbmF0aW9uIGFkZHJlc3M6IFNlbmFvTmV0XzE4OmE3
OmQwICg4ODpkYzo5NjoxODphNzpkMCkKICAgIEZyYWdtZW50IG51bWJlcjogMAogICAgU2VxdWVu
Y2UgbnVtYmVyOiAxMzkxCiAgICBRb3MgQ29udHJvbDogMHgwMDgwCiAgICAgICAgLi4uLiAuLi4u
IC4uLi4gMDAwMCA9IFRJRDogMAogICAgICAgIFsuLi4uIC4uLi4gLi4uLiAuMDAwID0gUHJpb3Jp
dHk6IEJlc3QgRWZmb3J0IChCZXN0IEVmZm9ydCkgKDApXQogICAgICAgIC4uLi4gLi4uLiAuLi4w
IC4uLi4gPSBRb1MgYml0IDQ6IEJpdHMgOC0xNSBvZiBRb1MgQ29udHJvbCBmaWVsZCBhcmUgVFhP
UCBEdXJhdGlvbiBSZXF1ZXN0ZWQKICAgICAgICAuLi4uIC4uLi4gLjAwLiAuLi4uID0gQWNrIFBv
bGljeTogTm9ybWFsIEFjayAoMHgwMDAwKQogICAgICAgIC4uLi4gLi4uLiAxLi4uIC4uLi4gPSBQ
YXlsb2FkIFR5cGU6IEEtTVNEVQogICAgICAgIDAwMDAgMDAwMCAuLi4uIC4uLi4gPSBUWE9QIER1
cmF0aW9uIFJlcXVlc3RlZDogMCAobm8gVFhPUCByZXF1ZXN0ZWQpCklFRUUgODAyLjExIEFnZ3Jl
Z2F0ZSBNU0RVCiAgICBBLU1TRFUgU3ViZnJhbWUgIzEKICAgICAgICBEZXN0aW5hdGlvbiBhZGRy
ZXNzOiBJbnRlbF81ZTpiZDo4NSAoMDA6MGU6MGM6NWU6YmQ6ODUpCiAgICAgICAgU291cmNlIGFk
ZHJlc3M6IEFwcGxlXzY3OjI0OjU0ICg4NDozODozNTo2NzoyNDo1NCkKICAgICAgICBBLU1TRFUg
TGVuZ3RoOiAxNTA4CiAgICAgICAgTG9naWNhbC1MaW5rIENvbnRyb2wKICAgICAgICAgICAgRFNB
UDogU05BUCAoMHhhYSkKICAgICAgICAgICAgSUcgQml0OiBJbmRpdmlkdWFsCiAgICAgICAgICAg
IFNTQVA6IFNOQVAgKDB4YWEpCiAgICAgICAgICAgIENSIEJpdDogQ29tbWFuZAogICAgICAgICAg
ICBDb250cm9sIGZpZWxkOiBVLCBmdW5jPVVJICgweDAzKQogICAgICAgICAgICAgICAgMDAwLiAw
MC4uID0gQ29tbWFuZDogVW5udW1iZXJlZCBJbmZvcm1hdGlvbiAoMHgwMCkKICAgICAgICAgICAg
ICAgIC4uLi4gLi4xMSA9IEZyYW1lIHR5cGU6IFVubnVtYmVyZWQgZnJhbWUgKDB4MDMpCiAgICAg
ICAgICAgIE9yZ2FuaXphdGlvbiBDb2RlOiBFbmNhcHN1bGF0ZWQgRXRoZXJuZXQgKDB4MDAwMDAw
KQogICAgICAgICAgICBUeXBlOiBJUCAoMHgwODAwKQogICAgICAgIEludGVybmV0IFByb3RvY29s
IFZlcnNpb24gNCwgU3JjOiAxOTIuMTY4LjI1NC41MiAoMTkyLjE2OC4yNTQuNTIpLCBEc3Q6IDE5
Mi4xNjguMjU0LjEgKDE5Mi4xNjguMjU0LjEpCiAgICAgICAgICAgIFZlcnNpb246IDQKICAgICAg
ICAgICAgSGVhZGVyIGxlbmd0aDogMjAgYnl0ZXMKICAgICAgICAgICAgRGlmZmVyZW50aWF0ZWQg
U2VydmljZXMgRmllbGQ6IDB4MDAgKERTQ1AgMHgwMDogRGVmYXVsdDsgRUNOOiAweDAwOiBOb3Qt
RUNUIChOb3QgRUNOLUNhcGFibGUgVHJhbnNwb3J0KSkKICAgICAgICAgICAgICAgIDAwMDAgMDAu
LiA9IERpZmZlcmVudGlhdGVkIFNlcnZpY2VzIENvZGVwb2ludDogRGVmYXVsdCAoMHgwMCkKICAg
ICAgICAgICAgICAgIC4uLi4gLi4wMCA9IEV4cGxpY2l0IENvbmdlc3Rpb24gTm90aWZpY2F0aW9u
OiBOb3QtRUNUIChOb3QgRUNOLUNhcGFibGUgVHJhbnNwb3J0KSAoMHgwMCkKICAgICAgICAgICAg
VG90YWwgTGVuZ3RoOiAxNTAwCiAgICAgICAgICAgIElkZW50aWZpY2F0aW9uOiAweGEwM2QgKDQx
MDIxKQogICAgICAgICAgICBGbGFnczogMHgwMiAoRG9uJ3QgRnJhZ21lbnQpCiAgICAgICAgICAg
ICAgICAwLi4uIC4uLi4gPSBSZXNlcnZlZCBiaXQ6IE5vdCBzZXQKICAgICAgICAgICAgICAgIC4x
Li4gLi4uLiA9IERvbid0IGZyYWdtZW50OiBTZXQKICAgICAgICAgICAgICAgIC4uMC4gLi4uLiA9
IE1vcmUgZnJhZ21lbnRzOiBOb3Qgc2V0CiAgICAgICAgICAgIEZyYWdtZW50IG9mZnNldDogMAog
ICAgICAgICAgICBUaW1lIHRvIGxpdmU6IDY0CiAgICAgICAgICAgIFByb3RvY29sOiBUQ1AgKDYp
CiAgICAgICAgICAgIEhlYWRlciBjaGVja3N1bTogMHgxNzU3IFtjb3JyZWN0XQogICAgICAgICAg
ICAgICAgW0dvb2Q6IFRydWVdCiAgICAgICAgICAgICAgICBbQmFkOiBGYWxzZV0KICAgICAgICAg
ICAgU291cmNlOiAxOTIuMTY4LjI1NC41MiAoMTkyLjE2OC4yNTQuNTIpCiAgICAgICAgICAgIERl
c3RpbmF0aW9uOiAxOTIuMTY4LjI1NC4xICgxOTIuMTY4LjI1NC4xKQogICAgICAgICAgICBbU291
cmNlIEdlb0lQOiBVbmtub3duXQogICAgICAgICAgICBbRGVzdGluYXRpb24gR2VvSVA6IFVua25v
d25dCiAgICAgICAgVHJhbnNtaXNzaW9uIENvbnRyb2wgUHJvdG9jb2wsIFNyYyBQb3J0OiA1Mjcz
NCAoNTI3MzQpLCBEc3QgUG9ydDogNTAwMSAoNTAwMSksIFNlcTogMzA2NTQ0MSwgQWNrOiAxLCBM
ZW46IDE0NDgKICAgICAgICAgICAgU291cmNlIHBvcnQ6IDUyNzM0ICg1MjczNCkKICAgICAgICAg
ICAgRGVzdGluYXRpb24gcG9ydDogNTAwMSAoNTAwMSkKICAgICAgICAgICAgW1N0cmVhbSBpbmRl
eDogMF0KICAgICAgICAgICAgU2VxdWVuY2UgbnVtYmVyOiAzMDY1NDQxICAgIChyZWxhdGl2ZSBz
ZXF1ZW5jZSBudW1iZXIpCiAgICAgICAgICAgIFtOZXh0IHNlcXVlbmNlIG51bWJlcjogMzA2Njg4
OSAgICAocmVsYXRpdmUgc2VxdWVuY2UgbnVtYmVyKV0KICAgICAgICAgICAgQWNrbm93bGVkZ21l
bnQgbnVtYmVyOiAxICAgIChyZWxhdGl2ZSBhY2sgbnVtYmVyKQogICAgICAgICAgICBIZWFkZXIg
bGVuZ3RoOiAzMiBieXRlcwogICAgICAgICAgICBGbGFnczogMHgwMTAgKEFDSykKICAgICAgICAg
ICAgICAgIDAwMC4gLi4uLiAuLi4uID0gUmVzZXJ2ZWQ6IE5vdCBzZXQKICAgICAgICAgICAgICAg
IC4uLjAgLi4uLiAuLi4uID0gTm9uY2U6IE5vdCBzZXQKICAgICAgICAgICAgICAgIC4uLi4gMC4u
LiAuLi4uID0gQ29uZ2VzdGlvbiBXaW5kb3cgUmVkdWNlZCAoQ1dSKTogTm90IHNldAogICAgICAg
ICAgICAgICAgLi4uLiAuMC4uIC4uLi4gPSBFQ04tRWNobzogTm90IHNldAogICAgICAgICAgICAg
ICAgLi4uLiAuLjAuIC4uLi4gPSBVcmdlbnQ6IE5vdCBzZXQKICAgICAgICAgICAgICAgIC4uLi4g
Li4uMSAuLi4uID0gQWNrbm93bGVkZ21lbnQ6IFNldAogICAgICAgICAgICAgICAgLi4uLiAuLi4u
IDAuLi4gPSBQdXNoOiBOb3Qgc2V0CiAgICAgICAgICAgICAgICAuLi4uIC4uLi4gLjAuLiA9IFJl
c2V0OiBOb3Qgc2V0CiAgICAgICAgICAgICAgICAuLi4uIC4uLi4gLi4wLiA9IFN5bjogTm90IHNl
dAogICAgICAgICAgICAgICAgLi4uLiAuLi4uIC4uLjAgPSBGaW46IE5vdCBzZXQKICAgICAgICAg
ICAgV2luZG93IHNpemUgdmFsdWU6IDgyMzUKICAgICAgICAgICAgW0NhbGN1bGF0ZWQgd2luZG93
IHNpemU6IDEzMTc2MF0KICAgICAgICAgICAgW1dpbmRvdyBzaXplIHNjYWxpbmcgZmFjdG9yOiAx
Nl0KICAgICAgICAgICAgQ2hlY2tzdW06IDB4MWI3MiBbY29ycmVjdF0KICAgICAgICAgICAgICAg
IFtHb29kIENoZWNrc3VtOiBUcnVlXQogICAgICAgICAgICAgICAgW0JhZCBDaGVja3N1bTogRmFs
c2VdCiAgICAgICAgICAgIE9wdGlvbnM6ICgxMiBieXRlcyksIE5vLU9wZXJhdGlvbiAoTk9QKSwg
Tm8tT3BlcmF0aW9uIChOT1ApLCBUaW1lc3RhbXBzCiAgICAgICAgICAgICAgICBOby1PcGVyYXRp
b24gKE5PUCkKICAgICAgICAgICAgICAgICAgICBUeXBlOiAxCiAgICAgICAgICAgICAgICAgICAg
ICAgIDAuLi4gLi4uLiA9IENvcHkgb24gZnJhZ21lbnRhdGlvbjogTm8KICAgICAgICAgICAgICAg
ICAgICAgICAgLjAwLiAuLi4uID0gQ2xhc3M6IENvbnRyb2wgKDApCiAgICAgICAgICAgICAgICAg
ICAgICAgIC4uLjAgMDAwMSA9IE51bWJlcjogTm8tT3BlcmF0aW9uIChOT1ApICgxKQogICAgICAg
ICAgICAgICAgTm8tT3BlcmF0aW9uIChOT1ApCiAgICAgICAgICAgICAgICAgICAgVHlwZTogMQog
ICAgICAgICAgICAgICAgICAgICAgICAwLi4uIC4uLi4gPSBDb3B5IG9uIGZyYWdtZW50YXRpb246
IE5vCiAgICAgICAgICAgICAgICAgICAgICAgIC4wMC4gLi4uLiA9IENsYXNzOiBDb250cm9sICgw
KQogICAgICAgICAgICAgICAgICAgICAgICAuLi4wIDAwMDEgPSBOdW1iZXI6IE5vLU9wZXJhdGlv
biAoTk9QKSAoMSkKICAgICAgICAgICAgICAgIFRpbWVzdGFtcHM6IFRTdmFsIDEzMDI1MTQwMTEs
IFRTZWNyIDMyODc0NjU4MgogICAgICAgICAgICAgICAgICAgIEtpbmQ6IFRpbWVzdGFtcCAoOCkK
ICAgICAgICAgICAgICAgICAgICBMZW5ndGg6IDEwCiAgICAgICAgICAgICAgICAgICAgVGltZXN0
YW1wIHZhbHVlOiAxMzAyNTE0MDExCiAgICAgICAgICAgICAgICAgICAgVGltZXN0YW1wIGVjaG8g
cmVwbHk6IDMyODc0NjU4MgogICAgICAgIERhdGEgKDE0NDggYnl0ZXMpCgowMDAwICAzMCAzMSAz
MiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIz
NDUKMDAxMCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEg
ICA2Nzg5MDEyMzQ1Njc4OTAxCjAwMjAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMy
IDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowMDMwICAzOCAzOSAzMCAzMSAzMiAz
MyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDA0MCAg
MzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkw
MTIzNDU2Nzg5CjAwNTAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMz
IDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowMDYwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAz
NCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDA3MCAgMzIgMzMgMzQg
MzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3
CjAwODAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAg
ODkwMTIzNDU2Nzg5MDEyMwowMDkwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAz
NSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDBhMCAgMzAgMzEgMzIgMzMgMzQgMzUg
MzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjAwYjAgIDM2
IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0
NTY3ODkwMQowMGMwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAz
NiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDBkMCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYg
MzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjAwZTAgIDM0IDM1IDM2IDM3
IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQow
MGYwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAx
MjM0NTY3ODkwMTIzNDUKMDEwMCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcg
MzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjAxMTAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4
IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowMTIwICAzOCAz
OSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4
OTAxMjMKMDEzMCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzgg
MzkgICA0NTY3ODkwMTIzNDU2Nzg5CjAxNDAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5
IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowMTUwICAzNiAzNyAzOCAzOSAz
MCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDE2
MCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1
Njc4OTAxMjM0NTY3CjAxNzAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMw
IDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowMTgwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAz
MSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDE5MCAgMzAgMzEg
MzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEy
MzQ1CjAxYTAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMx
ICAgNjc4OTAxMjM0NTY3ODkwMQowMWIwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAz
MiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDFjMCAgMzggMzkgMzAgMzEgMzIg
MzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjAxZDAg
IDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5
MDEyMzQ1Njc4OQowMWUwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAz
MyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDFmMCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMg
MzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjAyMDAgIDMyIDMzIDM0
IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2
NwowMjEwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAg
IDg5MDEyMzQ1Njc4OTAxMjMKMDIyMCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQg
MzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjAyMzAgIDMwIDMxIDMyIDMzIDM0IDM1
IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowMjQwICAz
NiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIz
NDU2Nzg5MDEKMDI1MCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUg
MzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjAyNjAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2
IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowMjcwICAzNCAzNSAzNiAz
NyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkK
MDI4MCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAw
MTIzNDU2Nzg5MDEyMzQ1CjAyOTAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3
IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQowMmEwICAzMiAzMyAzNCAzNSAzNiAzNyAz
OCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDJiMCAgMzgg
MzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3
ODkwMTIzCjAyYzAgIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4
IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowMmQwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAz
OSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDJlMCAgMzYgMzcgMzggMzkg
MzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjAy
ZjAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0
NTY3ODkwMTIzNDU2NwowMzAwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAz
MCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDMxMCAgMzQgMzUgMzYgMzcgMzggMzkgMzAg
MzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjAzMjAgIDMwIDMx
IDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAx
MjM0NQowMzMwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAz
MSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDM0MCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEg
MzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjAzNTAgIDM4IDM5IDMwIDMxIDMy
IDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowMzYw
ICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4
OTAxMjM0NTY3ODkKMDM3MCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIg
MzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjAzODAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMz
IDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQowMzkwICAzMiAzMyAz
NCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1
NjcKMDNhMCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMg
ICA4OTAxMjM0NTY3ODkwMTIzCjAzYjAgIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0
IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowM2MwICAzMCAzMSAzMiAzMyAzNCAz
NSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDNkMCAg
MzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEy
MzQ1Njc4OTAxCjAzZTAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1
IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowM2YwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAz
NiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDQwMCAgMzQgMzUgMzYg
MzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5
CjA0MTAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAg
MDEyMzQ1Njc4OTAxMjM0NQowNDIwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAz
NyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDQzMCAgMzIgMzMgMzQgMzUgMzYgMzcg
MzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjA0NDAgIDM4
IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2
Nzg5MDEyMwowNDUwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAz
OCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDQ2MCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzgg
MzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjA0NzAgIDM2IDM3IDM4IDM5
IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQow
NDgwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIz
NDU2Nzg5MDEyMzQ1NjcKMDQ5MCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkg
MzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjA0YTAgIDM0IDM1IDM2IDM3IDM4IDM5IDMw
IDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowNGIwICAzMCAz
MSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkw
MTIzNDUKMDRjMCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAg
MzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjA0ZDAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMx
IDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowNGUwICAzOCAzOSAzMCAzMSAz
MiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDRm
MCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3
ODkwMTIzNDU2Nzg5CjA1MDAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMy
IDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowNTEwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAz
MyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDUyMCAgMzIgMzMg
MzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0
NTY3CjA1MzAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMz
ICAgODkwMTIzNDU2Nzg5MDEyMwowNTQwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAz
NCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDU1MCAgMzAgMzEgMzIgMzMgMzQg
MzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjA1NjAg
IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAx
MjM0NTY3ODkwMQowNTcwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAz
NSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDU4MCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUg
MzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjA1OTAgIDM0IDM1IDM2
IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4
OQowNWEwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgICAgICAgICAgICAgICAgICAgICAgICAg
IDAxMjM0NTY3CiAgICAgICAgICAgIERhdGE6IDMwMzEzMjMzMzQzNTM2MzczODM5MzAzMTMyMzMz
NDM1MzYzNzM4MzkzMDMxMzIzMy4uLgogICAgICAgICAgICBbTGVuZ3RoOiAxNDQ4XQogICAgQS1N
U0RVIFN1YmZyYW1lICMyCiAgICAgICAgRGVzdGluYXRpb24gYWRkcmVzczogSW50ZWxfNWU6YmQ6
ODUgKDAwOjBlOjBjOjVlOmJkOjg1KQogICAgICAgIFNvdXJjZSBhZGRyZXNzOiBBcHBsZV82Nzoy
NDo1NCAoODQ6Mzg6MzU6Njc6MjQ6NTQpCiAgICAgICAgQS1NU0RVIExlbmd0aDogMTUwOAogICAg
ICAgIExvZ2ljYWwtTGluayBDb250cm9sCiAgICAgICAgICAgIERTQVA6IFNOQVAgKDB4YWEpCiAg
ICAgICAgICAgIElHIEJpdDogSW5kaXZpZHVhbAogICAgICAgICAgICBTU0FQOiBTTkFQICgweGFh
KQogICAgICAgICAgICBDUiBCaXQ6IENvbW1hbmQKICAgICAgICAgICAgQ29udHJvbCBmaWVsZDog
VSwgZnVuYz1VSSAoMHgwMykKICAgICAgICAgICAgICAgIDAwMC4gMDAuLiA9IENvbW1hbmQ6IFVu
bnVtYmVyZWQgSW5mb3JtYXRpb24gKDB4MDApCiAgICAgICAgICAgICAgICAuLi4uIC4uMTEgPSBG
cmFtZSB0eXBlOiBVbm51bWJlcmVkIGZyYW1lICgweDAzKQogICAgICAgICAgICBPcmdhbml6YXRp
b24gQ29kZTogRW5jYXBzdWxhdGVkIEV0aGVybmV0ICgweDAwMDAwMCkKICAgICAgICAgICAgVHlw
ZTogSVAgKDB4MDgwMCkKICAgICAgICBJbnRlcm5ldCBQcm90b2NvbCBWZXJzaW9uIDQsIFNyYzog
MTkyLjE2OC4yNTQuNTIgKDE5Mi4xNjguMjU0LjUyKSwgRHN0OiAxOTIuMTY4LjI1NC4xICgxOTIu
MTY4LjI1NC4xKQogICAgICAgICAgICBWZXJzaW9uOiA0CiAgICAgICAgICAgIEhlYWRlciBsZW5n
dGg6IDIwIGJ5dGVzCiAgICAgICAgICAgIERpZmZlcmVudGlhdGVkIFNlcnZpY2VzIEZpZWxkOiAw
eDAwIChEU0NQIDB4MDA6IERlZmF1bHQ7IEVDTjogMHgwMDogTm90LUVDVCAoTm90IEVDTi1DYXBh
YmxlIFRyYW5zcG9ydCkpCiAgICAgICAgICAgICAgICAwMDAwIDAwLi4gPSBEaWZmZXJlbnRpYXRl
ZCBTZXJ2aWNlcyBDb2RlcG9pbnQ6IERlZmF1bHQgKDB4MDApCiAgICAgICAgICAgICAgICAuLi4u
IC4uMDAgPSBFeHBsaWNpdCBDb25nZXN0aW9uIE5vdGlmaWNhdGlvbjogTm90LUVDVCAoTm90IEVD
Ti1DYXBhYmxlIFRyYW5zcG9ydCkgKDB4MDApCiAgICAgICAgICAgIFRvdGFsIExlbmd0aDogMTUw
MAogICAgICAgICAgICBJZGVudGlmaWNhdGlvbjogMHhjMTI3ICg0OTQ0NykKICAgICAgICAgICAg
RmxhZ3M6IDB4MDIgKERvbid0IEZyYWdtZW50KQogICAgICAgICAgICAgICAgMC4uLiAuLi4uID0g
UmVzZXJ2ZWQgYml0OiBOb3Qgc2V0CiAgICAgICAgICAgICAgICAuMS4uIC4uLi4gPSBEb24ndCBm
cmFnbWVudDogU2V0CiAgICAgICAgICAgICAgICAuLjAuIC4uLi4gPSBNb3JlIGZyYWdtZW50czog
Tm90IHNldAogICAgICAgICAgICBGcmFnbWVudCBvZmZzZXQ6IDAKICAgICAgICAgICAgVGltZSB0
byBsaXZlOiA2NAogICAgICAgICAgICBQcm90b2NvbDogVENQICg2KQogICAgICAgICAgICBIZWFk
ZXIgY2hlY2tzdW06IDB4ZjY2YyBbY29ycmVjdF0KICAgICAgICAgICAgICAgIFtHb29kOiBUcnVl
XQogICAgICAgICAgICAgICAgW0JhZDogRmFsc2VdCiAgICAgICAgICAgIFNvdXJjZTogMTkyLjE2
OC4yNTQuNTIgKDE5Mi4xNjguMjU0LjUyKQogICAgICAgICAgICBEZXN0aW5hdGlvbjogMTkyLjE2
OC4yNTQuMSAoMTkyLjE2OC4yNTQuMSkKICAgICAgICAgICAgW1NvdXJjZSBHZW9JUDogVW5rbm93
bl0KICAgICAgICAgICAgW0Rlc3RpbmF0aW9uIEdlb0lQOiBVbmtub3duXQogICAgICAgIFRyYW5z
bWlzc2lvbiBDb250cm9sIFByb3RvY29sLCBTcmMgUG9ydDogNTI3MzQgKDUyNzM0KSwgRHN0IFBv
cnQ6IDUwMDEgKDUwMDEpLCBTZXE6IDMwNjY4ODksIEFjazogMSwgTGVuOiAxNDQ4CiAgICAgICAg
ICAgIFNvdXJjZSBwb3J0OiA1MjczNCAoNTI3MzQpCiAgICAgICAgICAgIERlc3RpbmF0aW9uIHBv
cnQ6IDUwMDEgKDUwMDEpCiAgICAgICAgICAgIFtTdHJlYW0gaW5kZXg6IDBdCiAgICAgICAgICAg
IFNlcXVlbmNlIG51bWJlcjogMzA2Njg4OSAgICAocmVsYXRpdmUgc2VxdWVuY2UgbnVtYmVyKQog
ICAgICAgICAgICBbTmV4dCBzZXF1ZW5jZSBudW1iZXI6IDMwNjgzMzcgICAgKHJlbGF0aXZlIHNl
cXVlbmNlIG51bWJlcildCiAgICAgICAgICAgIEFja25vd2xlZGdtZW50IG51bWJlcjogMSAgICAo
cmVsYXRpdmUgYWNrIG51bWJlcikKICAgICAgICAgICAgSGVhZGVyIGxlbmd0aDogMzIgYnl0ZXMK
ICAgICAgICAgICAgRmxhZ3M6IDB4MDEwIChBQ0spCiAgICAgICAgICAgICAgICAwMDAuIC4uLi4g
Li4uLiA9IFJlc2VydmVkOiBOb3Qgc2V0CiAgICAgICAgICAgICAgICAuLi4wIC4uLi4gLi4uLiA9
IE5vbmNlOiBOb3Qgc2V0CiAgICAgICAgICAgICAgICAuLi4uIDAuLi4gLi4uLiA9IENvbmdlc3Rp
b24gV2luZG93IFJlZHVjZWQgKENXUik6IE5vdCBzZXQKICAgICAgICAgICAgICAgIC4uLi4gLjAu
LiAuLi4uID0gRUNOLUVjaG86IE5vdCBzZXQKICAgICAgICAgICAgICAgIC4uLi4gLi4wLiAuLi4u
ID0gVXJnZW50OiBOb3Qgc2V0CiAgICAgICAgICAgICAgICAuLi4uIC4uLjEgLi4uLiA9IEFja25v
d2xlZGdtZW50OiBTZXQKICAgICAgICAgICAgICAgIC4uLi4gLi4uLiAwLi4uID0gUHVzaDogTm90
IHNldAogICAgICAgICAgICAgICAgLi4uLiAuLi4uIC4wLi4gPSBSZXNldDogTm90IHNldAogICAg
ICAgICAgICAgICAgLi4uLiAuLi4uIC4uMC4gPSBTeW46IE5vdCBzZXQKICAgICAgICAgICAgICAg
IC4uLi4gLi4uLiAuLi4wID0gRmluOiBOb3Qgc2V0CiAgICAgICAgICAgIFdpbmRvdyBzaXplIHZh
bHVlOiA4MjM1CiAgICAgICAgICAgIFtDYWxjdWxhdGVkIHdpbmRvdyBzaXplOiAxMzE3NjBdCiAg
ICAgICAgICAgIFtXaW5kb3cgc2l6ZSBzY2FsaW5nIGZhY3RvcjogMTZdCiAgICAgICAgICAgIENo
ZWNrc3VtOiAweDEzYzggW2NvcnJlY3RdCiAgICAgICAgICAgICAgICBbR29vZCBDaGVja3N1bTog
VHJ1ZV0KICAgICAgICAgICAgICAgIFtCYWQgQ2hlY2tzdW06IEZhbHNlXQogICAgICAgICAgICBP
cHRpb25zOiAoMTIgYnl0ZXMpLCBOby1PcGVyYXRpb24gKE5PUCksIE5vLU9wZXJhdGlvbiAoTk9Q
KSwgVGltZXN0YW1wcwogICAgICAgICAgICAgICAgTm8tT3BlcmF0aW9uIChOT1ApCiAgICAgICAg
ICAgICAgICAgICAgVHlwZTogMQogICAgICAgICAgICAgICAgICAgICAgICAwLi4uIC4uLi4gPSBD
b3B5IG9uIGZyYWdtZW50YXRpb246IE5vCiAgICAgICAgICAgICAgICAgICAgICAgIC4wMC4gLi4u
LiA9IENsYXNzOiBDb250cm9sICgwKQogICAgICAgICAgICAgICAgICAgICAgICAuLi4wIDAwMDEg
PSBOdW1iZXI6IE5vLU9wZXJhdGlvbiAoTk9QKSAoMSkKICAgICAgICAgICAgICAgIE5vLU9wZXJh
dGlvbiAoTk9QKQogICAgICAgICAgICAgICAgICAgIFR5cGU6IDEKICAgICAgICAgICAgICAgICAg
ICAgICAgMC4uLiAuLi4uID0gQ29weSBvbiBmcmFnbWVudGF0aW9uOiBObwogICAgICAgICAgICAg
ICAgICAgICAgICAuMDAuIC4uLi4gPSBDbGFzczogQ29udHJvbCAoMCkKICAgICAgICAgICAgICAg
ICAgICAgICAgLi4uMCAwMDAxID0gTnVtYmVyOiBOby1PcGVyYXRpb24gKE5PUCkgKDEpCiAgICAg
ICAgICAgICAgICBUaW1lc3RhbXBzOiBUU3ZhbCAxMzAyNTE0MDExLCBUU2VjciAzMjg3NDY1ODIK
ICAgICAgICAgICAgICAgICAgICBLaW5kOiBUaW1lc3RhbXAgKDgpCiAgICAgICAgICAgICAgICAg
ICAgTGVuZ3RoOiAxMAogICAgICAgICAgICAgICAgICAgIFRpbWVzdGFtcCB2YWx1ZTogMTMwMjUx
NDAxMQogICAgICAgICAgICAgICAgICAgIFRpbWVzdGFtcCBlY2hvIHJlcGx5OiAzMjg3NDY1ODIK
ICAgICAgICBEYXRhICgxNDQ4IGJ5dGVzKQoKMDAwMCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUg
MzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjAwMTAgIDM0IDM1IDM2
IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4
OQowMDIwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAg
IDAxMjM0NTY3ODkwMTIzNDUKMDAzMCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYg
MzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjAwNDAgIDMyIDMzIDM0IDM1IDM2IDM3
IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowMDUwICAz
OCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1
Njc4OTAxMjMKMDA2MCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcg
MzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjAwNzAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4
IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowMDgwICAzNiAzNyAzOCAz
OSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEK
MDA5MCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAy
MzQ1Njc4OTAxMjM0NTY3CjAwYTAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5
IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowMGIwICAzNCAzNSAzNiAzNyAzOCAzOSAz
MCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDBjMCAgMzAg
MzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5
MDEyMzQ1CjAwZDAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMw
IDMxICAgNjc4OTAxMjM0NTY3ODkwMQowMGUwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAz
MSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDBmMCAgMzggMzkgMzAgMzEg
MzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjAx
MDAgIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2
Nzg5MDEyMzQ1Njc4OQowMTEwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAz
MiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDEyMCAgMzYgMzcgMzggMzkgMzAgMzEgMzIg
MzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjAxMzAgIDMyIDMz
IDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIz
NDU2NwowMTQwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAz
MyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDE1MCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMg
MzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjAxNjAgIDMwIDMxIDMyIDMzIDM0
IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowMTcw
ICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkw
MTIzNDU2Nzg5MDEKMDE4MCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQg
MzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjAxOTAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1
IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowMWEwICAzNCAzNSAz
NiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3
ODkKMDFiMCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUg
ICAwMTIzNDU2Nzg5MDEyMzQ1CjAxYzAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2
IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQowMWQwICAzMiAzMyAzNCAzNSAzNiAz
NyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDFlMCAg
MzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0
NTY3ODkwMTIzCjAxZjAgIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3
IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowMjAwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAz
OCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDIxMCAgMzYgMzcgMzgg
MzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAx
CjAyMjAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAg
MjM0NTY3ODkwMTIzNDU2NwowMjMwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAz
OSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDI0MCAgMzQgMzUgMzYgMzcgMzggMzkg
MzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjAyNTAgIDMw
IDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4
OTAxMjM0NQowMjYwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAz
MCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDI3MCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAg
MzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjAyODAgIDM4IDM5IDMwIDMx
IDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwow
MjkwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1
Njc4OTAxMjM0NTY3ODkKMDJhMCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEg
MzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjAyYjAgIDM2IDM3IDM4IDM5IDMwIDMxIDMy
IDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQowMmMwICAzMiAz
MyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEy
MzQ1NjcKMDJkMCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIg
MzMgICA4OTAxMjM0NTY3ODkwMTIzCjAyZTAgIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMz
IDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowMmYwICAzMCAzMSAzMiAzMyAz
NCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3ODkwMTIzNDUKMDMw
MCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5
MDEyMzQ1Njc4OTAxCjAzMTAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0
IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowMzIwICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAz
NSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMKMDMzMCAgMzQgMzUg
MzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0NTY3ODkwMTIzNDU2
Nzg5CjAzNDAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1
ICAgMDEyMzQ1Njc4OTAxMjM0NQowMzUwICAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAz
NiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDM2MCAgMzIgMzMgMzQgMzUgMzYg
MzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAxMjM0NTY3CjAzNzAg
IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzICAgODkwMTIz
NDU2Nzg5MDEyMwowMzgwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAz
NyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDM5MCAgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcg
MzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjAzYTAgIDM2IDM3IDM4
IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkw
MQowM2IwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAg
IDIzNDU2Nzg5MDEyMzQ1NjcKMDNjMCAgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzgg
MzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjAzZDAgIDM0IDM1IDM2IDM3IDM4IDM5
IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1Njc4OQowM2UwICAz
MCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAgIDAxMjM0NTY3
ODkwMTIzNDUKMDNmMCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkg
MzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjA0MDAgIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMw
IDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowNDEwICAzOCAzOSAzMCAz
MSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEyMzQ1Njc4OTAxMjMK
MDQyMCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgICA0
NTY3ODkwMTIzNDU2Nzg5CjA0MzAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMx
IDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowNDQwICAzNiAzNyAzOCAzOSAzMCAzMSAz
MiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5MDEKMDQ1MCAgMzIg
MzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgICAyMzQ1Njc4OTAx
MjM0NTY3CjA0NjAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxIDMy
IDMzICAgODkwMTIzNDU2Nzg5MDEyMwowNDcwICAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAz
MyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDQ4MCAgMzAgMzEgMzIgMzMg
MzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2Nzg5MDEyMzQ1CjA0
OTAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5IDMwIDMxICAgNjc4
OTAxMjM0NTY3ODkwMQowNGEwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAz
NCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDRiMCAgMzggMzkgMzAgMzEgMzIgMzMgMzQg
MzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgICA4OTAxMjM0NTY3ODkwMTIzCjA0YzAgIDM0IDM1
IDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5ICAgNDU2Nzg5MDEyMzQ1
Njc4OQowNGQwICAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAzNCAz
NSAgIDAxMjM0NTY3ODkwMTIzNDUKMDRlMCAgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUg
MzYgMzcgMzggMzkgMzAgMzEgICA2Nzg5MDEyMzQ1Njc4OTAxCjA0ZjAgIDMyIDMzIDM0IDM1IDM2
IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3ICAgMjM0NTY3ODkwMTIzNDU2NwowNTAw
ICAzOCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAzMiAzMyAgIDg5MDEy
MzQ1Njc4OTAxMjMKMDUxMCAgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYg
MzcgMzggMzkgICA0NTY3ODkwMTIzNDU2Nzg5CjA1MjAgIDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3
IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1ICAgMDEyMzQ1Njc4OTAxMjM0NQowNTMwICAzNiAzNyAz
OCAzOSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAzMCAzMSAgIDY3ODkwMTIzNDU2Nzg5
MDEKMDU0MCAgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcg
ICAyMzQ1Njc4OTAxMjM0NTY3CjA1NTAgIDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4
IDM5IDMwIDMxIDMyIDMzICAgODkwMTIzNDU2Nzg5MDEyMwowNTYwICAzNCAzNSAzNiAzNyAzOCAz
OSAzMCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAgIDQ1Njc4OTAxMjM0NTY3ODkKMDU3MCAg
MzAgMzEgMzIgMzMgMzQgMzUgMzYgMzcgMzggMzkgMzAgMzEgMzIgMzMgMzQgMzUgICAwMTIzNDU2
Nzg5MDEyMzQ1CjA1ODAgIDM2IDM3IDM4IDM5IDMwIDMxIDMyIDMzIDM0IDM1IDM2IDM3IDM4IDM5
IDMwIDMxICAgNjc4OTAxMjM0NTY3ODkwMQowNTkwICAzMiAzMyAzNCAzNSAzNiAzNyAzOCAzOSAz
MCAzMSAzMiAzMyAzNCAzNSAzNiAzNyAgIDIzNDU2Nzg5MDEyMzQ1NjcKMDVhMCAgMzggMzkgMzAg
MzEgMzIgMzMgMzQgMzUgICAgICAgICAgICAgICAgICAgICAgICAgICA4OTAxMjM0NQogICAgICAg
ICAgICBEYXRhOiAzODM5MzAzMTMyMzMzNDM1MzYzNzM4MzkzMDMxMzIzMzM0MzUzNjM3MzgzOTMw
MzEuLi4KICAgICAgICAgICAgW0xlbmd0aDogMTQ0OF0K
--001a1135eef0a6fea104fdbc8bfa
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--001a1135eef0a6fea104fdbc8bfa--
