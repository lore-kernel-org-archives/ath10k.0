Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22d.google.com ([2a00:1450:4010:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X5X0v-0002f4-0P
 for ath10k@lists.infradead.org; Fri, 11 Jul 2014 09:21:13 +0000
Received: by mail-la0-f45.google.com with SMTP id ty20so574645lab.18
 for <ath10k@lists.infradead.org>; Fri, 11 Jul 2014 02:20:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALhHN=qZqZVAV3_ybRL5rhip407Vg9nm53mK=h_JNwV1t0HDog@mail.gmail.com>
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
 <CABnBrYVY_KY8mMAKhy-DV1s3+vut8oR_LohyBJX3GtW7RT=3XA@mail.gmail.com>
 <CALhHN=ozVHCzFPnz318SNE+YxgArdqKu4pTrc-Q1V88ujCz2ow@mail.gmail.com>
 <CABnBrYXsLi3XNbBGtgW7rFhOXW7oOvh29+GapFsX+Rzx36V_QA@mail.gmail.com>
 <CALhHN=qZqZVAV3_ybRL5rhip407Vg9nm53mK=h_JNwV1t0HDog@mail.gmail.com>
Date: Fri, 11 Jul 2014 11:20:44 +0200
Message-ID: <CALhHN=p-2HVGLM0m4O8ddZYO4D6LV8UYSVW5HM3Y9a9-HJoL4w@mail.gmail.com>
Subject: Re: A-MSDU reception not working?
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Content-Type: multipart/mixed; boundary=001a11c366a6beb3b904fde774a2
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
To: Denton Gentry <denton.gentry@gmail.com>
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

--001a11c366a6beb3b904fde774a2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10 July 2014 20:48, Janusz Dziedzic <janusz.dziedzic@tieto.com> wrote:
> On 10 July 2014 15:40, Denton Gentry <denton.gentry@gmail.com> wrote:
>> I added this check for RX_ATTENTION_FLAGS_FCS_ERR in
>> ath10k_htt_rx_handler, along with a printk to verify that the code was
>> being run.
>>
>>                         if (attention & RX_ATTENTION_FLAGS_FCS_ERR) {
>>                                 ath10k_htt_rx_free_msdu_chain(msdu_head)=
;
>>                                 printk(KERN_WARNING
>> "ath10k_htt_rx_handler: amsdu RX_ATTENTION_FLAGS_FCS_ERR");
>>                                 continue;
>>                         } else
>>                                 rx_status->flag &=3D ~RX_FLAG_FAILED_FCS=
_CRC;
>>
>> I see the printk appear in dmesg, so I know some packets are hitting
>> it. The throughput from the MacOS 802.11ac STA does improve, from 5-20
>> Mbps without to 50-60 Mbps with this change. Prior to adding the
>> reorder buffer fix, the MacBook was getting 170 Mbps.
>>
>> However, packets with incorrect TCP checksums are still being
>> delivered to the Ethernet connected server at the other end. I
>> gathered pcaps at the MacBook, at the ath10k AP, on another ath10k
>> device configured in monitor mode as a sniffer, and at the
>> Ethernet-connected Ubuntu server at the other end.
>>
> Thanks for logs.
>
> This is strange, this suggest MPDU have correct FCS, and only data in
> MSDU are incorrect.
> Seems like a FW/HW bug, while FCS was correct and other sniffer see
> correct frame.
> Seems also like not driver issue while this incorrect data are at
> offset ~0x14C. In driver we touch mostly head and  tail of the data.
> FW report IP/TCP checksum - interesting what status you get for such pack=
et.
> This is line:
> skb->ip_summed =3D ath10k_htt_rx_get_csum_state(skb);
>
> I see also this is QAM256 (5/6) - but FCS was correct so this suggest
> MPDU frame was received correctly.
> Interesting issue, I am curious who and when insert this wrong data.
> Will check this more tomorrow.
>
> BTW - this patch below is wrong, when we will start reorder we will
> deliver only one MSDU - last one from AMSDU - instead of all, and all
> with MORE flag will go directly to stack not waiting for reorder
> decision. So could introduce other problems.
>
> +       /* not impelemented correctly when driver report separete A-MSDUs=
 */
> +        if (status->flag & RX_FLAG_AMSDU_MORE)
> +               goto dont_reorder;
> +
>
> So we have 3 options in case of using mac80211 reordering:
> 1) use big frame (memcpy overhead)
> 2) report amsd as a skb list (not sure mac80211 patches will be merged
> - under discussion)
> 3) rewrite mac80211 reordering code to support AMSDU_MORE correctly
>
> Other option can be, put reordering code in the driver (table for each
> mpdu for peer and for each tid - resources required - while we have
> almost the same allocated in mac80211 already)
>
> BR
> Janusz
>
>>
>> server.pcap
>> Captured from the Ubuntu iperf server, connected to the AP via Ethernet.
>>
>> Packet #10: TCP seq 4369, IP ID 0x6373, TCP checksum incorrect
>> At offset 208 bytes into the data we see =E2=80=9C32 33 34 35=E2=80=9D r=
eplaced by =E2=80=9C98 19 1e b7=E2=80=9D
>>
>> Packet #17: TCP seq 4369, IP ID 0x6373, TCP checksum correct
>> Packet #23: TCP seq 4369, IP ID 0xe152, TCP checksum correct
>>
>>
>> ap.pcap
>> Captured from the AP.
>>
>> Packet #10: TCP seq 4369, IP ID 0x6373, TCP checksum incorrect
>> At offset 208 bytes into the data we see =E2=80=9C32 33 34 35=E2=80=9D r=
eplaced by =E2=80=9C98 19 1e b7=E2=80=9D
>> This is the same pattern we see in the Ubuntu server's trace.
>>
>> Packet #14: TCP seq 4369, IP ID 0x6373, TCP checksum correct
>> This was a Wifi-layer retransmit, which I think means the firmware
>> knew that something was wrong with packet #10. In the wifisniffer
>> trace, packet #19 is a Block ACK from the AP which requests one packet
>> be retransmitted.
>> However it appears that RX_ATTENTION_FLAGS_FCS_ERR was not set on
>> packet #10, so it was forwarded to the Ethernet.
>>
>> Packet #24: TCP seq 4369, IP ID 0xe152, TCP checksum correct
>> This is a TCP-layer retransmit from the MacBook, as the IP ID is differe=
nt.
>>
>>
>> wifisniffer.pcap
>> A second ath10 configured in monitor mode.
>> Packet #17 AMSDU#1: TCP seq 4369, IP ID 0x6373, TCP checksum correct
>> This is packet #10 in the AP trace. Note that the sniffer did not see
>> =E2=80=9C98 19 1e b7=E2=80=9D like the AP did.
>>
>> Packet #20 AMSDU#1: TCP seq 4369, IP ID 0x6373, TCP checksum correct
>> This is packet #14 in the AP trace.
>>
>> Packet #39 AMSDU#2: TCP seq 4369, IP ID 0xe152, TCP checksum correct
>> This is packet #24 in the AP trace.
>>
OK, this is what I see in wifi sniffer
seq_num =3D 68, packet #17 - AMSDU1, AMSDU2
blockACK - missing packet 68 - this suggest AP get this frame but
probably FCS was wrong?
seq_num =3D 68, retransmitted, packet #20, AMSDU1, AMSDU2
blockAck OK

Seems FW report missing packet, but didn't set INVALID_FCS??


Added some logs to my test env and activate monitor interface on AP.
This is what I see in logs:

[12990.863184] ath10k: xxx mpdu 3882 fcs err 0
[12990.863187] ath10k: xxx v4 1 v6 0 tcp 1 udp 0 ip_ck_ok 1 tcp_ck_ok 0
[12990.863189] ath10k: xxx mpdu 3882 msdu 0 ip_summed 0

[12990.863205] ath10k: xxx mpdu 3883 fcs err 0
[12990.863208] ath10k: xxx v4 1 v6 0 tcp 1 udp 0 ip_ck_ok 1 tcp_ck_ok 0
[12990.863210] ath10k: xxx mpdu 3883 msdu 0 ip_summed 0
[12990.863212] ath10k: xxx v4 1 v6 0 tcp 1 udp 0 ip_ck_ok 1 tcp_ck_ok 0
[12990.863215] ath10k: xxx mpdu 3883 msdu 1 ip_summed 0
[12990.863217] ath10k: xxx v4 1 v6 0 tcp 1 udp 0 ip_ck_ok 1 tcp_ck_ok 0
[12990.863219] ath10k: xxx mpdu 3883 msdu 2 ip_summed 0

Which mean we get MPDU with 3 MSDU subframes. FCS for SN 3883 was correct!
But IP/TCP checksum in msdus subframes not.

Seems FW report FCS incorrectly in some cases.
Will check this more today.

BTW as a workaround we can skip all packets with wrong FCS and wrong
TCP/IP checksum.
Patch attached.

BR
Janusz


>>
>> macbook.pcapng
>> 56: TCP seq 4369, IP ID 0x6373, TCP checksum correct
>> This is the original transmission. Wireshark on MacOS cannot put the
>> interface into monitor mode, so we do not see the Wifi-layer
>> retransmission of this packet.
>>
>> 65: TCP seq 4369, IP ID 0xe152, TCP checksum correct
>> This is a TCP retransmission, triggered because it received duplicate
>> TCP ACKs back from the Ubuntu server.
>>
>>
>> On Wed, Jul 9, 2014 at 12:39 AM, Janusz Dziedzic
>> <janusz.dziedzic@tieto.com> wrote:
>>> On 9 July 2014 08:09, Denton Gentry <denton.gentry@gmail.com> wrote:
>>>> I ran iperf on an 802.11ac MacBook Air, through my ath10 AP, and to an
>>>> Ubuntu system connected to the AP via Ethernet. The AP was running the
>>>> reorder buffer patches, the patch to make A-MSDU bypass the reorder
>>>> buffer, and the patch to make amsdu aggregation configurable via
>>>> debugfs.
>>>>
>>>> http://lists.infradead.org/pipermail/ath10k/2014-June/002551.html
>>>> http://lists.infradead.org/pipermail/ath10k/2014-June/002553.html
>>>> http://lists.infradead.org/pipermail/ath10k/2014-July/002597.html
>>>> http://permalink.gmane.org/gmane.linux.kernel.wireless.general/124128
>>>>
>>>> It was notably not running the patch from earlier in this thread to
>>>> copy A-MSDU subframes into one skb.
>>>>
>>>>
>>>> I used a second ath10k AP configured in monitor mode as a Wifi
>>>> sniffer. I also gathered pcaps on the MacBook Air and on the Ubuntu
>>>> system. Wireshark on the MacBook cannot gather radiotap headers nor
>>>> put the interface into monitor mode, so we see only Ethernet frames
>>>> and we don't see retransmissions on the Wifi link.
>>>>
>>>> I've attached decodes of the same two packets as captured by the
>>>> MacBook, by the sniffer, and by the Ubuntu server.
>>>>
>>>> The MacBook sends two frames, TCP sequence numbers 3065441 and 3066889
>>>> (the Wireshark "relative sequence number"). In the Wifi sniffer we see
>>>> these being aggregated as two subframes in an A-MSDU frame. The first
>>>> time this A-MSDU is sent it is corrupted in the air. We see the TCP
>>>> checksum of one of the subframes is wrong, and a few bytes of the
>>>> payload replaced with "&gt%'g9(1$".
>>>>
>>>> The A-MSDU is retransmitted a short time later, and the second time
>>>> the TCP checksum of both subframes is correct.
>>>>
>>>> This is all fine so far.
>>>>
>>>> However in the pcap taken from the Ubuntu server, we see TCP sequence
>>>> number 3065441 being delivered *twice.* The first time, the TCP
>>>> checksum is wrong. The second time the TCP checksum is correct.
>>>>
>>>> To me, it looks like A-MSDU frames with bad FCS are not being
>>>> discarded after ieee80211_rx_monitor(). The corrupted frames are being
>>>> delivered. Delivering the corrupted frames results in sending more TCP
>>>> Dup ACKs for the same sequence number back to the MacBook, and I think
>>>> this is what causes the MacBook to decide there is congestion and slow
>>>> down.
>>>>
>>> OK, to be sure this is the main issue we can just drop frames with wron=
g FCS.
>>> Could you check this:
>>>
>>> @@ -1267,10 +1267,10 @@ static void ath10k_htt_rx_handler(struct
>>> ath10k_htt *htt,
>>>                                 continue;
>>>                         }
>>>
>>> -                       if (attention & RX_ATTENTION_FLAGS_FCS_ERR)
>>> -                               rx_status->flag |=3D RX_FLAG_FAILED_FCS=
_CRC;
>>> -                       else
>>> -                               rx_status->flag &=3D ~RX_FLAG_FAILED_FC=
S_CRC;
>>> +                       if (attention & RX_ATTENTION_FLAGS_FCS_ERR) {
>>> +                               ath10k_htt_rx_free_msdu_chain(msdu_head=
);
>>> +                               continue;
>>> +                       }
>>>
>>>                         if (attention & RX_ATTENTION_FLAGS_TKIP_MIC_ERR=
)
>>>
>>> If will help we will have to check how to handle monitor + ap case
>>> correctly, one of idea is to not drop frames with wrong FCS only in
>>> case of standalone monitor mode.
>>> But, please try this patch to be sure.
>>>
>>> BR
>>> Janusz
>>>
>>>
>>>> One note: the wifi sniffer does not show the same corruption to the
>>>> same packet as the pcap from the Ubuntu system shows. I think that is
>>>> normal: the sniffer won't see precisely the same noise, won't have
>>>> precisely the same receive sensitivity, and its antennas are not
>>>> pointing in the same direction as the primary AP. If I do this test
>>>> again, I'll gather a pcap on the primary AP as well to compare to what
>>>> we see on the Ubuntu system.
>>>>
>>>>
>>>> On Tue, Jul 8, 2014 at 12:29 AM, Janusz Dziedzic
>>>> <janusz.dziedzic@tieto.com> wrote:
>>>>> On 8 July 2014 09:02, Janusz Dziedzic <janusz.dziedzic@tieto.com> wro=
te:
>>>>>> On 8 July 2014 08:50, Janusz Dziedzic <janusz.dziedzic@tieto.com> wr=
ote:
>>>>>>> On 8 July 2014 08:43, Denton Gentry <denton.gentry@gmail.com> wrote=
:
>>>>>>>> I think I know what is happening now, though I've no idea why. The
>>>>>>>> throughput is low because we have many TCP retransmissions. We hav=
e
>>>>>>>> retransmissions because the TCP checksum is wrong on a number of
>>>>>>>> frames, and I do find data corruption in the payload so the checks=
um
>>>>>>>> definitely should be wrong. All of the corrupted frames were
>>>>>>>> originally one of the subframes in an A-MSDU packet.
>>>>>>>>
>>>>>>>> An example follows at the end of this message, as dissected by
>>>>>>>> Wireshark. iperf sends a very regular data pattern of "0123456789.=
.."
>>>>>>>> over and over. Note how in subframe #2 offset 0x1e0 the bytes "32 =
33
>>>>>>>> 34" have been replaced by "72 36 35"
>>>>>>>>
>>>>>>>> 01e0  32 33 34 35 36 37 38 39 30 31 72 36 35 35 36 37   2345678901=
r65567
>>>>>>>>
>>>>>>>> I added printks at the bottom of ath10k_htt_rx_amsdu immediately
>>>>>>>> before the call to ath10k_process_rx. I found this same packet, an=
d we
>>>>>>>> see the "72 36 35" corruption in the printk. So I think it happene=
d in
>>>>>>>> ath10k_process_rx or before, not anything weird after passing it u=
p to
>>>>>>>> mac80211.
>>>>>>>>
>>>>>>>> [  101.863712] ath10k: 35 36 37 38 39 30 31 32 33 34 35 36 37 38 3=
9 30
>>>>>>>> [  101.863727] ath10k: 31 32 33 34 35 36 37 38 39 30 31 32 33 34 3=
5 36
>>>>>>>> [  101.863742] ath10k: 37 38 39 30 31 32 33 34 35 36 37 38 39 30 3=
1 32
>>>>>>>> [  101.863757] ath10k: 33 34 35 36 37 38 39 30 31 72 36 35 35 36 3=
7 38
>>>>>>>> [  101.863773] ath10k: 39 30 31 32 33 34 35 36 37 38 39 30 31 32 3=
3 34
>>>>>>>> [  101.863788] ath10k: 35 36 37 38 39 30 31 32 33 34 35 36 37 38 3=
9 30
>>>>>>>> [  101.863803] ath10k: 31 32 33 34 35 36 37 38 39 30 31 32 33 34 3=
5 36
>>>>>>>>
>>>>>>>>
>>>>>>>> I've found a number of examples of similar corruption, always with
>>>>>>>> between one and four bytes replaced.
>>>>>>>>
>>>>>>>> 35363738 -> e52c6e07
>>>>>>>> 3435 -> b43f
>>>>>>>> 3839 -> c238
>>>>>>>> 31 -> 7f
>>>>>>>> 3435 -> 7436
>>>>>>>> 30 -> 50
>>>>>>>> 3233 -> bc37
>>>>>>>>
>>>>>>> Seems this could be because of:
>>>>>>>
>>>>>>> + /* cfg80211 expect this padding */
>>>>>>> + padding =3D (4 - (skb->len + sizeof(subframe_hdr))) & 0x3;
>>>>>>> + skb_put(skb, padding);
>>>>>>>
>>>>>>
>>>>>> BTW, when AP (ath10k) send TCP ACK - are this packets also AMSDU?
>>>>>> I see in my case AP can send 3 x A-MSDU (with total size 304 bytes)
>>>>>> small frames aggregated. Maybe your HW have problems with that.
>>>>>> As I remember correctly someone some time ago report problems with
>>>>>> MacBook pro retina but I am not sure this is the same, while no one
>>>>>> tests the fix.
>>>>>>
>>>>>>>>
>>>>>>>> The packet described above, dissected by Wireshark:
>>>>>>>>
>>>>>>>> No.     Time        Source                Destination
>>>>>>>> Protocol Length Info
>>>>>>>>    2235 18.953349   192.168.144.79        192.168.144.13        TC=
P
>>>>>>>>   3112   52697 > 5001 [ACK] Seq=3D1391553 Ack=3D1 Win=3D131760 [TC=
P CHECKSUM
>>>>>>>> INCORRECT] Len=3D1448 TSval=3D1298580657 TSecr=3D4294947481
>>>>>>>>
>>>>>>>> Frame 2235: 3112 bytes on wire (24896 bits), 3112 bytes captured (=
24896 bits)
>>>>>>>>     Encapsulation type: IEEE 802.11 plus radiotap radio header (23=
)
>>>>>>>>     Arrival Time: Jul  7, 2014 23:03:37.763365000 PDT
>>>>>>>>     [Time shift for this packet: 0.000000000 seconds]
>>>>>>>>     Epoch Time: 1404799417.763365000 seconds
>>>>>>>>     [Time delta from previous captured frame: 0.003476000 seconds]
>>>>>>>>     [Time delta from previous displayed frame: 0.515641000 seconds=
]
>>>>>>>>     [Time since reference or first frame: 18.953349000 seconds]
>>>>>>>>     Frame Number: 2235
>>>>>>>>     Frame Length: 3112 bytes (24896 bits)
>>>>>>>>     Capture Length: 3112 bytes (24896 bits)
>>>>>>>>     [Frame is marked: False]
>>>>>>>>     [Frame is ignored: False]
>>>>>>>>     [Protocols in frame: radiotap:wlan:llc:ip:tcp:data:llc:ip:tcp:=
data]
>>>>>>>>     [Coloring Rule Name: TCP]
>>>>>>>>     [Coloring Rule String: tcp]
>>>>>>>> Radiotap Header v0, Length 38
>>>>>>>>     Header revision: 0
>>>>>>>>     Header pad: 0
>>>>>>>>     Header length: 38
>>>>>>>>     Present flags
>>>>>>>>         .... .... .... .... .... .... .... ...1 =3D TSFT: True
>>>>>>>>         .... .... .... .... .... .... .... ..1. =3D Flags: True
>>>>>>>>         .... .... .... .... .... .... .... .0.. =3D Rate: False
>>>>>>>>         .... .... .... .... .... .... .... 1... =3D Channel: True
>>>>>>>>         .... .... .... .... .... .... ...0 .... =3D FHSS: False
>>>>>>>>         .... .... .... .... .... .... ..1. .... =3D dBm Antenna Si=
gnal: True
>>>>>>>>         .... .... .... .... .... .... .0.. .... =3D dBm Antenna No=
ise: False
>>>>>>>>         .... .... .... .... .... .... 0... .... =3D Lock Quality: =
False
>>>>>>>>         .... .... .... .... .... ...0 .... .... =3D TX Attenuation=
: False
>>>>>>>>         .... .... .... .... .... ..0. .... .... =3D dB TX Attenuat=
ion: False
>>>>>>>>         .... .... .... .... .... .0.. .... .... =3D dBm TX Power: =
False
>>>>>>>>         .... .... .... .... .... 1... .... .... =3D Antenna: True
>>>>>>>>         .... .... .... .... ...0 .... .... .... =3D dB Antenna Sig=
nal: False
>>>>>>>>         .... .... .... .... ..0. .... .... .... =3D dB Antenna Noi=
se: False
>>>>>>>>         .... .... .... .... .1.. .... .... .... =3D RX flags: True
>>>>>>>>         .... .... .... .0.. .... .... .... .... =3D Channel+: Fals=
e
>>>>>>>>         .... .... .... 0... .... .... .... .... =3D HT information=
: False
>>>>>>>>         .... .... ...0 .... .... .... .... .... =3D A-MPDU Status:=
 False
>>>>>>>>         .... .... ..1. .... .... .... .... .... =3D VHT informatio=
n: True
>>>>>>>>         ...0 0000 00.. .... .... .... .... .... =3D Reserved: 0x00=
000000
>>>>>>>>         ..0. .... .... .... .... .... .... .... =3D Radiotap NS ne=
xt: False
>>>>>>>>         .0.. .... .... .... .... .... .... .... =3D Vendor NS next=
: False
>>>>>>>>         0... .... .... .... .... .... .... .... =3D Ext: False
>>>>>>>>     MAC timestamp: 78051063
>>>>>>>>     Flags: 0x00
>>>>>>>>         .... ...0 =3D CFP: False
>>>>>>>>         .... ..0. =3D Preamble: Long
>>>>>>>>         .... .0.. =3D WEP: False
>>>>>>>>         .... 0... =3D Fragmentation: False
>>>>>>>>         ...0 .... =3D FCS at end: False
>>>>>>>>         ..0. .... =3D Data Pad: False
>>>>>>>>         .0.. .... =3D Bad FCS: False
>>>>>>>>         0... .... =3D Short GI: False
>>>>>>>>     Channel frequency: 5745 [A 149]
>>>>>>>>     Channel type: 802.11a (0x0140)
>>>>>>>>         .... .... ...0 .... =3D Turbo: False
>>>>>>>>         .... .... ..0. .... =3D Complementary Code Keying (CCK): F=
alse
>>>>>>>>         .... .... .1.. .... =3D Orthogonal Frequency-Division
>>>>>>>> Multiplexing (OFDM): True
>>>>>>>>         .... .... 0... .... =3D 2 GHz spectrum: False
>>>>>>>>         .... ...1 .... .... =3D 5 GHz spectrum: True
>>>>>>>>         .... ..0. .... .... =3D Passive: False
>>>>>>>>         .... .0.. .... .... =3D Dynamic CCK-OFDM: False
>>>>>>>>         .... 0... .... .... =3D Gaussian Frequency Shift Keying (G=
FSK): False
>>>>>>>>         ...0 .... .... .... =3D GSM (900MHz): False
>>>>>>>>         ..0. .... .... .... =3D Static Turbo: False
>>>>>>>>         .0.. .... .... .... =3D Half Rate Channel (10MHz Channel W=
idth): False
>>>>>>>>         0... .... .... .... =3D Quarter Rate Channel (5MHz Channel=
 Width): False
>>>>>>>>     SSI Signal: -53 dBm
>>>>>>>>     Antenna: 0
>>>>>>>>     RX flags: 0x0000
>>>>>>>>         .... .... .... .... .... ..0. =3D Bad PLCP: False
>>>>>>>>     VHT information
>>>>>>>>         Known VHT information: 0x44
>>>>>>>>             .... .... .... ...0 =3D STBC: False
>>>>>>>>             .... .... .... ..0. =3D TXOP_PS_NOT_ALLOWED: False
>>>>>>>>             .... .... .... .1.. =3D Guard interval: True
>>>>>>>>             .... .... .... 0... =3D SGI Nsym disambiguation: False
>>>>>>>>             .... .... ...0 .... =3D LDPC extra OFDM symbol: False
>>>>>>>>             .... .... ..0. .... =3D Beamformed: False
>>>>>>>>             .... .... .1.. .... =3D Bandwidth: True
>>>>>>>>             .... .... 0... .... =3D Group ID: False
>>>>>>>>             .... ...0 .... .... =3D Partial AID: False
>>>>>>>>         .... .0.. =3D Guard interval: long (0)
>>>>>>>>         Bandwidth: 80 MHz (4)
>>>>>>>>         User 0: MCS 8
>>>>>>>>             1000 .... =3D MCS index 0: 8 (256-QAM 3/4)
>>>>>>>>             .... 0010 =3D Spatial streams 0: 2
>>>>>>>>             Space-time streams 0: 2
>>>>>>>>             Coding 0: BCC (0)
>>>>>>>>             [Data Rate: 702.0 Mb/s]
>>>>>>>> IEEE 802.11 QoS Data, Flags: .......T
>>>>>>>>     Type/Subtype: QoS Data (0x28)
>>>>>>>>     Frame Control Field: 0x8801
>>>>>>>>         .... ..00 =3D Version: 0
>>>>>>>>         .... 10.. =3D Type: Data frame (2)
>>>>>>>>         1000 .... =3D Subtype: 8
>>>>>>>>         Flags: 0x01
>>>>>>>>             .... ..01 =3D DS status: Frame from STA to DS via an A=
P (To
>>>>>>>> DS: 1 From DS: 0) (0x01)
>>>>>>>>             .... .0.. =3D More Fragments: This is the last fragmen=
t
>>>>>>>>             .... 0... =3D Retry: Frame is not being retransmitted
>>>>>>>>             ...0 .... =3D PWR MGT: STA will stay up
>>>>>>>>             ..0. .... =3D More Data: No data buffered
>>>>>>>>             .0.. .... =3D Protected flag: Data is not protected
>>>>>>>>             0... .... =3D Order flag: Not strictly ordered
>>>>>>>>     .000 0000 0011 0000 =3D Duration: 48 microseconds
>>>>>>>>     Receiver address: SenaoNet_18:a8:00 (88:dc:96:18:a8:00)
>>>>>>>>     BSS Id: SenaoNet_18:a8:00 (88:dc:96:18:a8:00)
>>>>>>>>     Transmitter address: Apple_67:24:54 (84:38:35:67:24:54)
>>>>>>>>     Source address: Apple_67:24:54 (84:38:35:67:24:54)
>>>>>>>>     Destination address: SenaoNet_18:a8:00 (88:dc:96:18:a8:00)
>>>>>>>>     Fragment number: 0
>>>>>>>>     Sequence number: 1021
>>>>>>>>     Qos Control: 0x0080
>>>>>>>>         .... .... .... 0000 =3D TID: 0
>>>>>>>>         [.... .... .... .000 =3D Priority: Best Effort (Best Effor=
t) (0)]
>>>>>>>>         .... .... ...0 .... =3D QoS bit 4: Bits 8-15 of QoS Contro=
l
>>>>>>>> field are TXOP Duration Requested
>>>>>>>>         .... .... .00. .... =3D Ack Policy: Normal Ack (0x0000)
>>>>>>>>         .... .... 1... .... =3D Payload Type: A-MSDU
>>>>>>>>         0000 0000 .... .... =3D TXOP Duration Requested: 0 (no TXO=
P requested)
>>>>>>>> IEEE 802.11 Aggregate MSDU
>>>>>>>>     A-MSDU Subframe #1
>>>>>>>>         Destination address: GoogleFi_00:14:cd (f8:8f:ca:00:14:cd)
>>>>>>>>         Source address: Apple_67:24:54 (84:38:35:67:24:54)
>>>>>>>>         A-MSDU Length: 1510
>>>>>>>>         Logical-Link Control
>>>>>>>>             DSAP: SNAP (0xaa)
>>>>>>>>             IG Bit: Individual
>>>>>>>>             SSAP: SNAP (0xaa)
>>>>>>>>             CR Bit: Command
>>>>>>>>             Control field: U, func=3DUI (0x03)
>>>>>>>>                 000. 00.. =3D Command: Unnumbered Information (0x0=
0)
>>>>>>>>                 .... ..11 =3D Frame type: Unnumbered frame (0x03)
>>>>>>>>             Organization Code: Encapsulated Ethernet (0x000000)
>>>>>>>>             Type: IP (0x0800)
>>>>>>>>         Internet Protocol Version 4, Src: 192.168.144.79
>>>>>>>> (192.168.144.79), Dst: 192.168.144.13 (192.168.144.13)
>>>>>>>>             Version: 4
>>>>>>>>             Header length: 20 bytes
>>>>>>>>             Differentiated Services Field: 0x00 (DSCP 0x00: Defaul=
t;
>>>>>>>> ECN: 0x00: Not-ECT (Not ECN-Capable Transport))
>>>>>>>>                 0000 00.. =3D Differentiated Services Codepoint: D=
efault (0x00)
>>>>>>>>                 .... ..00 =3D Explicit Congestion Notification: No=
t-ECT
>>>>>>>> (Not ECN-Capable Transport) (0x00)
>>>>>>>>             Total Length: 1500
>>>>>>>>             Identification: 0xc622 (50722)
>>>>>>>>             Flags: 0x00
>>>>>>>>                 0... .... =3D Reserved bit: Not set
>>>>>>>>                 .0.. .... =3D Don't fragment: Not set
>>>>>>>>                 ..0. .... =3D More fragments: Not set
>>>>>>>>             Fragment offset: 0
>>>>>>>>             Time to live: 64
>>>>>>>>             Protocol: TCP (6)
>>>>>>>>             Header checksum: 0x0d4c [correct]
>>>>>>>>                 [Good: True]
>>>>>>>>                 [Bad: False]
>>>>>>>>             Source: 192.168.144.79 (192.168.144.79)
>>>>>>>>             Destination: 192.168.144.13 (192.168.144.13)
>>>>>>>>             [Source GeoIP: Unknown]
>>>>>>>>             [Destination GeoIP: Unknown]
>>>>>>>>         Transmission Control Protocol, Src Port: 52697 (52697), Ds=
t
>>>>>>>> Port: 5001 (5001), Seq: 1390105, Ack: 1, Len: 1448
>>>>>>>>             Source port: 52697 (52697)
>>>>>>>>             Destination port: 5001 (5001)
>>>>>>>>             [Stream index: 0]
>>>>>>>>             Sequence number: 1390105    (relative sequence number)
>>>>>>>>             [Next sequence number: 1391553    (relative sequence n=
umber)]
>>>>>>>>             Acknowledgment number: 1    (relative ack number)
>>>>>>>>             Header length: 32 bytes
>>>>>>>>             Flags: 0x010 (ACK)
>>>>>>>>                 000. .... .... =3D Reserved: Not set
>>>>>>>>                 ...0 .... .... =3D Nonce: Not set
>>>>>>>>                 .... 0... .... =3D Congestion Window Reduced (CWR)=
: Not set
>>>>>>>>                 .... .0.. .... =3D ECN-Echo: Not set
>>>>>>>>                 .... ..0. .... =3D Urgent: Not set
>>>>>>>>                 .... ...1 .... =3D Acknowledgment: Set
>>>>>>>>                 .... .... 0... =3D Push: Not set
>>>>>>>>                 .... .... .0.. =3D Reset: Not set
>>>>>>>>                 .... .... ..0. =3D Syn: Not set
>>>>>>>>                 .... .... ...0 =3D Fin: Not set
>>>>>>>>             Window size value: 8235
>>>>>>>>             [Calculated window size: 131760]
>>>>>>>>             [Window size scaling factor: 16]
>>>>>>>>             Checksum: 0xa1c0 [correct]
>>>>>>>>                 [Good Checksum: True]
>>>>>>>>                 [Bad Checksum: False]
>>>>>>>>             Options: (12 bytes), No-Operation (NOP), No-Operation
>>>>>>>> (NOP), Timestamps
>>>>>>>>                 No-Operation (NOP)
>>>>>>>>                     Type: 1
>>>>>>>>                         0... .... =3D Copy on fragmentation: No
>>>>>>>>                         .00. .... =3D Class: Control (0)
>>>>>>>>                         ...0 0001 =3D Number: No-Operation (NOP) (=
1)
>>>>>>>>                 No-Operation (NOP)
>>>>>>>>                     Type: 1
>>>>>>>>                         0... .... =3D Copy on fragmentation: No
>>>>>>>>                         .00. .... =3D Class: Control (0)
>>>>>>>>                         ...0 0001 =3D Number: No-Operation (NOP) (=
1)
>>>>>>>>                 Timestamps: TSval 1298580657, TSecr 4294947481
>>>>>>>>                     Kind: Timestamp (8)
>>>>>>>>                     Length: 10
>>>>>>>>                     Timestamp value: 1298580657
>>>>>>>>                     Timestamp echo reply: 4294947481
>>>>>>>>         Data (1448 bytes)
>>>>>>>>
>>>>>>>> 0000  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 0010  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 0020  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 0030  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 0040  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 0050  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 0060  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 0070  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 0080  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 0090  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 00a0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 00b0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 00c0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 00d0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 00e0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 00f0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 0100  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 0110  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 0120  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 0130  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 0140  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 0150  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 0160  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 0170  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 0180  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 0190  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 01a0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 01b0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 01c0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 01d0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 01e0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 01f0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 0200  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 0210  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 0220  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 0230  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 0240  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 0250  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 0260  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 0270  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 0280  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 0290  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 02a0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 02b0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 02c0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 02d0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 02e0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 02f0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 0300  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 0310  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 0320  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 0330  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 0340  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 0350  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 0360  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 0370  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 0380  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 0390  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 03a0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 03b0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 03c0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 03d0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 03e0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 03f0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 0400  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 0410  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 0420  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 0430  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 0440  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 0450  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 0460  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 0470  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 0480  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 0490  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 04a0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 04b0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 04c0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 04d0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 04e0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 04f0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 0500  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 0510  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 0520  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 0530  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 0540  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 0550  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 0560  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 0570  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 0580  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 0590  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 05a0  34 35 36 37 38 39 30 31                           45678901
>>>>>>>>             Data: 343536373839303132333435363738393031323334353637=
...
>>>>>>>>             [Length: 1448]
>>>>>>>>     A-MSDU Subframe #2
>>>>>>>>         Destination address: GoogleFi_00:14:cd (f8:8f:ca:00:14:cd)
>>>>>>>>         Source address: Apple_67:24:54 (84:38:35:67:24:54)
>>>>>>>>         A-MSDU Length: 1510
>>>>>>>>         Logical-Link Control
>>>>>>>>             DSAP: SNAP (0xaa)
>>>>>>>>             IG Bit: Individual
>>>>>>>>             SSAP: SNAP (0xaa)
>>>>>>>>             CR Bit: Command
>>>>>>>>             Control field: U, func=3DUI (0x03)
>>>>>>>>                 000. 00.. =3D Command: Unnumbered Information (0x0=
0)
>>>>>>>>                 .... ..11 =3D Frame type: Unnumbered frame (0x03)
>>>>>>>>             Organization Code: Encapsulated Ethernet (0x000000)
>>>>>>>>             Type: IP (0x0800)
>>>>>>>>         Internet Protocol Version 4, Src: 192.168.144.79
>>>>>>>> (192.168.144.79), Dst: 192.168.144.13 (192.168.144.13)
>>>>>>>>             Version: 4
>>>>>>>>             Header length: 20 bytes
>>>>>>>>             Differentiated Services Field: 0x00 (DSCP 0x00: Defaul=
t;
>>>>>>>> ECN: 0x00: Not-ECT (Not ECN-Capable Transport))
>>>>>>>>                 0000 00.. =3D Differentiated Services Codepoint: D=
efault (0x00)
>>>>>>>>                 .... ..00 =3D Explicit Congestion Notification: No=
t-ECT
>>>>>>>> (Not ECN-Capable Transport) (0x00)
>>>>>>>>             Total Length: 1500
>>>>>>>>             Identification: 0xda09 (55817)
>>>>>>>>             Flags: 0x00
>>>>>>>>                 0... .... =3D Reserved bit: Not set
>>>>>>>>                 .0.. .... =3D Don't fragment: Not set
>>>>>>>>                 ..0. .... =3D More fragments: Not set
>>>>>>>>             Fragment offset: 0
>>>>>>>>             Time to live: 64
>>>>>>>>             Protocol: TCP (6)
>>>>>>>>             Header checksum: 0xf964 [correct]
>>>>>>>>                 [Good: True]
>>>>>>>>                 [Bad: False]
>>>>>>>>             Source: 192.168.144.79 (192.168.144.79)
>>>>>>>>             Destination: 192.168.144.13 (192.168.144.13)
>>>>>>>>             [Source GeoIP: Unknown]
>>>>>>>>             [Destination GeoIP: Unknown]
>>>>>>>>         Transmission Control Protocol, Src Port: 52697 (52697), Ds=
t
>>>>>>>> Port: 5001 (5001), Seq: 1391553, Ack: 1, Len: 1448
>>>>>>>>             Source port: 52697 (52697)
>>>>>>>>             Destination port: 5001 (5001)
>>>>>>>>             [Stream index: 0]
>>>>>>>>             Sequence number: 1391553    (relative sequence number)
>>>>>>>>             [Next sequence number: 1393001    (relative sequence n=
umber)]
>>>>>>>>             Acknowledgment number: 1    (relative ack number)
>>>>>>>>             Header length: 32 bytes
>>>>>>>>             Flags: 0x010 (ACK)
>>>>>>>>                 000. .... .... =3D Reserved: Not set
>>>>>>>>                 ...0 .... .... =3D Nonce: Not set
>>>>>>>>                 .... 0... .... =3D Congestion Window Reduced (CWR)=
: Not set
>>>>>>>>                 .... .0.. .... =3D ECN-Echo: Not set
>>>>>>>>                 .... ..0. .... =3D Urgent: Not set
>>>>>>>>                 .... ...1 .... =3D Acknowledgment: Set
>>>>>>>>                 .... .... 0... =3D Push: Not set
>>>>>>>>                 .... .... .0.. =3D Reset: Not set
>>>>>>>>                 .... .... ..0. =3D Syn: Not set
>>>>>>>>                 .... .... ...0 =3D Fin: Not set
>>>>>>>>             Window size value: 8235
>>>>>>>>             [Calculated window size: 131760]
>>>>>>>>             [Window size scaling factor: 16]
>>>>>>>>             Checksum: 0x9a16 [incorrect, should be 0x5913 (maybe
>>>>>>>> caused by "TCP checksum offload"?)]
>>>>>
>>>>> And yes we are using checksum offload in ath10k.
>>>>> Best is using standalone 80211ac sniffer for that case to be sure
>>>>> about checksum.
>>>>>
>>>>>>>>                 [Good Checksum: False]
>>>>>>>>                 [Bad Checksum: True]
>>>>>>>>                     [Expert Info (Error/Checksum): Bad checksum]
>>>>>>>>                         [Message: Bad checksum]
>>>>>>>>                         [Severity level: Error]
>>>>>>>>                         [Group: Checksum]
>>>>>>>>             Options: (12 bytes), No-Operation (NOP), No-Operation
>>>>>>>> (NOP), Timestamps
>>>>>>>>                 No-Operation (NOP)
>>>>>>>>                     Type: 1
>>>>>>>>                         0... .... =3D Copy on fragmentation: No
>>>>>>>>                         .00. .... =3D Class: Control (0)
>>>>>>>>                         ...0 0001 =3D Number: No-Operation (NOP) (=
1)
>>>>>>>>                 No-Operation (NOP)
>>>>>>>>                     Type: 1
>>>>>>>>                         0... .... =3D Copy on fragmentation: No
>>>>>>>>                         .00. .... =3D Class: Control (0)
>>>>>>>>                         ...0 0001 =3D Number: No-Operation (NOP) (=
1)
>>>>>>>>                 Timestamps: TSval 1298580657, TSecr 4294947481
>>>>>>>>                     Kind: Timestamp (8)
>>>>>>>>                     Length: 10
>>>>>>>>                     Timestamp value: 1298580657
>>>>>>>>                     Timestamp echo reply: 4294947481
>>>>>>>>         Data (1448 bytes)
>>>>>>>>
>>>>>>>> 0000  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 0010  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 0020  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 0030  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 0040  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 0050  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 0060  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 0070  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 0080  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 0090  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 00a0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 00b0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 00c0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 00d0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 00e0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 00f0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 0100  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 0110  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 0120  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 0130  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 0140  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 0150  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 0160  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 0170  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 0180  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 0190  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 01a0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 01b0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 01c0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 01d0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 01e0  32 33 34 35 36 37 38 39 30 31 72 36 35 35 36 37   2345678901=
r65567
>>>>>>>> 01f0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 0200  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 0210  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 0220  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 0230  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 0240  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 0250  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 0260  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 0270  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 0280  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 0290  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 02a0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 02b0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 02c0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 02d0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 02e0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 02f0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 0300  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 0310  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 0320  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 0330  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 0340  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 0350  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 0360  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 0370  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 0380  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 0390  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 03a0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 03b0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 03c0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 03d0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 03e0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 03f0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 0400  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 0410  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 0420  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 0430  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 0440  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 0450  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 0460  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 0470  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 0480  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 0490  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 04a0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 04b0  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 04c0  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 04d0  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 04e0  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 04f0  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 0500  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 0510  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 0520  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 0530  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 0540  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 0550  32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37   2345678901=
234567
>>>>>>>> 0560  38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33   8901234567=
890123
>>>>>>>> 0570  34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39   4567890123=
456789
>>>>>>>> 0580  30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35   0123456789=
012345
>>>>>>>> 0590  36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31   6789012345=
678901
>>>>>>>> 05a0  32 33 34 35 36 37 38 39                           23456789
>>>>>>>>             Data: 323334353637383930313233343536373839303132333435=
...
>>>>>>>>             [Length: 1448]
>>>>>>>>
>>>>>>>> On Mon, Jul 7, 2014 at 12:26 PM, Denton Gentry <denton.gentry@gmai=
l.com> wrote:
>>>>>>>>> The initial results are not promising: a MacOS 802.11ac client ge=
ts
>>>>>>>>> between 0-2 Mbps with this change, where it was getting about 8 M=
bps
>>>>>>>>> prior to this change and ~170 Mbps prior to the reordering fix. A=
 pcap
>>>>>>>>> from the receiving system shows a very large number of out of ord=
er
>>>>>>>>> frames, likely due to TCP retransmission.
>>>>>>>>>
>>>>>>>>> An 802.11n MacBook gets very good throughput, only the 802.11ac
>>>>>>>>> MacBook shows the very poor result. I'm trying to figure out why.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> One specific note (and probably not related to the throughput): I
>>>>>>>>> believe ath10k_htt_rx_amsdu runs in the tasklet, which means it w=
ould
>>>>>>>>> need to use GFP_ATOMIC instead of GFP_KERNEL. Do I understand it
>>>>>>>>> correctly?
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On Mon, Jul 7, 2014 at 1:30 AM, Janusz Dziedzic
>>>>>>>>> <janusz.dziedzic@tieto.com> wrote:
>>>>>>>>>> On 6 July 2014 04:27, Adrian Chadd <adrian@freebsd.org> wrote:
>>>>>>>>>>> I think you may have to tell mac80211 that it's okay and not to=
 drop the frames.
>>>>>>>>>>>
>>>>>>>>>>> The earlier atheros chips would just give you the AMSDU frames =
as
>>>>>>>>>>> deaggregated A-MPDU sub-frames - you'd just pass the A-MSDU up =
to
>>>>>>>>>>> net80211 and it'd ull it apart. But if the driver is doing it (=
or,
>>>>>>>>>>> well, the chip is doing it) then mac80211 needs to know not to =
drop
>>>>>>>>>>> those sub-frames.
>>>>>>>>>>>
>>>>>>>>>>> I wonder if you'll ever get notified before the complete A-MPDU=
 has
>>>>>>>>>>> been received. That happens on previous chips. eg, you have an =
A-MPDU
>>>>>>>>>>> of 16 frames with 4 MSDUs in each MPDU. If you get notified and=
 handle
>>>>>>>>>>> half of one MPDU before you hit EOL, the next notification you =
process
>>>>>>>>>>> will be the next MSDU in the same MPDU - and then you'll hit th=
e
>>>>>>>>>>> reordering hilarity again.
>>>>>>>>>>>
>>>>>>>>>>> So hm, i will face the same issue in FreeBSD at some point, so =
I'd
>>>>>>>>>>> likely do what you're thinking of doing - pass up a chain of mb=
ufs
>>>>>>>>>>> representing the current MPDU and treat the whole lot as the fr=
ame(s)
>>>>>>>>>>> to care about. Honestly though, I'm kind of wondering whether I=
 should
>>>>>>>>>>> mostly just do what the Atheros reference driver does and treat=
 it as
>>>>>>>>>>> ethernet payload frames (ie, it's already de-encapsulated and t=
he
>>>>>>>>>>> reordering is already done) and just tack on the wifi header bi=
t via
>>>>>>>>>>> another of the DMA rings.
>>>>>>>>>>>
>>>>>>>>>>> Ugh, I really should sit down and write the FreeBSD version of =
this.
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> -a
>>>>>>>>>>>
>>>>>>>>>>> (I'm still having flashbacks from working on this firmware at Q=
CA. Aiee.)
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On 5 July 2014 06:55, Denton Gentry <denton.gentry@gmail.com> w=
rote:
>>>>>>>>>>>> There are two issues in handling the dis-aggregated A-MSDU sub=
frames
>>>>>>>>>>>> in ieee80211_sta_manage_reorder_buf:
>>>>>>>>>>>>
>>>>>>>>>>>> 1. The out-of-date check:
>>>>>>>>>>>>
>>>>>>>>>>>>         /* frame with out of date sequence number */
>>>>>>>>>>>>         if (ieee80211_sn_less(mpdu_seq_num, head_seq_num)) {
>>>>>>>>>>>>                 dev_kfree_skb(skb);
>>>>>>>>>>>>                 goto out;
>>>>>>>>>>>>         }
>>>>>>>>>>>>
>>>>>>>>>>>> As all of the subframes carry the same sequence number, the fi=
rst
>>>>>>>>>>>> subframe will be delivered and increment head_seq_num and then=
 all
>>>>>>>>>>>> subsequent subframes will be discarded.
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> 2. The duplicates check a bit later in the routine:
>>>>>>>>>>>>
>>>>>>>>>>>>         /* check if we already stored this frame */
>>>>>>>>>>>>         if (tid_agg_rx->reorder_buf[index]) {
>>>>>>>>>>>>                 dev_kfree_skb(skb);
>>>>>>>>>>>>                 goto out;
>>>>>>>>>>>>         }
>>>>>>>>>>>>
>>>>>>>>>>>> If there is enough packet loss that packets are queued in the =
reorder
>>>>>>>>>>>> buffer and not immediately released, then only the first subfr=
ame will
>>>>>>>>>>>> be stored. Subsequent subframes will be discarded as duplicate=
s.
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> An 802.11ac MacBook is able to get about 170 Mbps with iperf p=
rior to
>>>>>>>>>>>> the reordering buffer changes, and dropped to about 8 Mbps wit=
h the
>>>>>>>>>>>> reorder buffer. Hacking around the out-of-date sequence number=
 check
>>>>>>>>>>>> to allow all subframes to egress restores it to 170 Mbps.
>>>>>>>>>>>>
>>>>>>>>>>>> In the area where I'm testing there isn't enough 5 GHz noise t=
o make
>>>>>>>>>>>> the duplicates-check issue happen very often. By adding a prin=
tk I can
>>>>>>>>>>>> see that it does happen, but it doesn't impact the throughput =
and I
>>>>>>>>>>>> can't report the impact of fixing it.
>>>>>>>>>>>>
>>>>>>>>>>>> ----
>>>>>>>>>>>>
>>>>>>>>>>>> I do wonder if both of these are symptoms of dis-aggregating t=
he
>>>>>>>>>>>> A-MSDU too early. mac80211 expects to be dealing with the whol=
e MPDU
>>>>>>>>>>>> at a time, and the ath10k A-MSDU case is sending it subframes =
instead.
>>>>>>>>>>>> Trying to make the ath10k code send up all of the subframes as=
 a chain
>>>>>>>>>>>> of skbs didn't immediately work, but I do wonder if that would=
 better
>>>>>>>>>>>> match the mac80211 expectations.
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> On Fri, Jul 4, 2014 at 11:58 AM, Denton Gentry <denton.gentry@=
gmail.com> wrote:
>>>>>>>>>>>>> Yes, after some more testing it does look like an unfortunate
>>>>>>>>>>>>> interaction between the reorder buffer and A-MSDU. The disagg=
regated
>>>>>>>>>>>>> subframes all carry the same sequence number. The first subfr=
ame is
>>>>>>>>>>>>> released from the reorder buffer and increments the head_seq_=
num.
>>>>>>>>>>>>> Subsequent subframes are all discarded as being out of date.
>>>>>>>>>>>>>
>>>>>>>>>>>>> [  308.514021] ieee80211_sta_manage_reorder_buf: out of date =
seq=3D0xb05
>>>>>>>>>>>>> head=3D0xb06
>>>>>>>>>>>>> [  308.520577] ieee80211_sta_manage_reorder_buf: out of date =
seq=3D0xb0a
>>>>>>>>>>>>> head=3D0xb0b
>>>>>>>>>>>>> [  308.527198] ieee80211_sta_manage_reorder_buf: out of date =
seq=3D0xb0f
>>>>>>>>>>>>> head=3D0xb10
>>>>>>>>>>>>> [  308.533857] ieee80211_sta_manage_reorder_buf: out of date =
seq=3D0xb14
>>>>>>>>>>>>> head=3D0xb15
>>>>>>>>>>>>> [  308.540480] ieee80211_sta_manage_reorder_buf: out of date =
seq=3D0xb19
>>>>>>>>>>>>> head=3D0xb1a
>>>>>>>>>>>>> [  308.547730] ieee80211_sta_manage_reorder_buf: out of date =
seq=3D0xb1e
>>>>>>>>>>>>> head=3D0xb1f
>>>>>>>>>>>>> [  308.554069] ieee80211_sta_manage_reorder_buf: out of date =
seq=3D0xb23
>>>>>>>>>>>>> head=3D0xb24
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> On Wed, Jul 2, 2014 at 9:49 AM, Michal Kazior <michal.kazior@=
tieto.com> wrote:
>>>>>>>>>>>>>> On 30 June 2014 22:15, Denton Gentry <denton.gentry@gmail.co=
m> wrote:
>>>>>>>>>>>>>>> In iperf tests using a MacBook STA bridging through an ath1=
0k AP to an
>>>>>>>>>>>>>>> Ethernet server, I'm noticing very selective packet loss. T=
he second
>>>>>>>>>>>>>>> and subsequent frames in an A-MSDU packet appear to be drop=
ped.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> The AP sets the A-MSDU size to 3839 bytes, and the MacBook =
frequently
>>>>>>>>>>>>>>> sends A-MSDU packets containing two TCP frames. So far as I=
 can tell,
>>>>>>>>>>>>>>> the first TCP frame from an A-MSDU aggregate is delivered a=
nd the
>>>>>>>>>>>>>>> second is consistently lost. The MacBook generally retransm=
its the
>>>>>>>>>>>>>>> lost frame as a singleton with no aggregation, and the retr=
ansmitted
>>>>>>>>>>>>>>> frame makes it through.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> This became more noticeable after the reordering fixes in
>>>>>>>>>>>>>>> http://lists.infradead.org/pipermail/ath10k/2014-June/00255=
2.html
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> I see this A-MSDU packet loss behavior both with and withou=
t the
>>>>>>>>>>>>>>> reordering fixes, the first packet in an A-MSDU is delivere=
d while the
>>>>>>>>>>>>>>> second is dropped. However, *without* the reordering fixes =
(and
>>>>>>>>>>>>>>> therefore with packets delivered out of order) the MacBook =
sends
>>>>>>>>>>>>>>> relatively few A-MSDU frames. *With* the reordering fixes, =
so all
>>>>>>>>>>>>>>> packets are delivered in order, the MacBook keeps sending A=
-MSDU and
>>>>>>>>>>>>>>> therefore has to deal with more packet loss. I suspect it i=
s an
>>>>>>>>>>>>>>> interaction with the MacOS TCP congestion window which I'm =
likely
>>>>>>>>>>>>>>> never going to fully understand, its stuck in a region of t=
he
>>>>>>>>>>>>>>> congestion window where the Wifi driver keeps choosing to u=
sing
>>>>>>>>>>>>>>> A-MSDU.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> I was actually worried about A-MSDU once A-MPDU re-ordering =
issue was raised.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> ath10k fw reports A-MSDU subframes separately. To avoid memo=
ry
>>>>>>>>>>>>>> copying/allocation overhead each subframe is reported as a s=
ingly
>>>>>>>>>>>>>> A-MSDU MSDU to mac80211 with an extra rx_flag AMSDU_MORE. Pe=
rhaps
>>>>>>>>>>>>>> A-MPDU reordering intereferes with A-MSDU now?
>>>>>>>>>>>>>>
>>>>>>>>>> Denton could you try attached patch: report amsdu in one big fra=
me.
>>>>>>>>>> If help, we can add amsdu skb list support to mac80211/cfg80211 =
- to
>>>>>>>>>> improve performance and reduce memcpy, while currently we have s=
kb
>>>>>>>>>> frames, put them in one big skb and next cfg80211 split them aga=
in
>>>>>>>>>> into msdus and report to stack.
>>>>>>>>>>
>>>>>>>>>> BR
>>>>>>>>>> Janusz

--001a11c366a6beb3b904fde774a2
Content-Type: text/x-diff; charset=US-ASCII; 
	name="0001-ath10k-skip-frames-with-tcp-ip-checksum.patch"
Content-Disposition: attachment; 
	filename="0001-ath10k-skip-frames-with-tcp-ip-checksum.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hxhamb4q0

RnJvbSAyZTljYTYzMTBlNzY4NDdiZGQ2NDhmODIxMDA2NWY1OGRkYWE2NTcyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKYW51c3ogRHppZWR6aWMgPGphbnVzei5kemllZHppY0B0aWV0
by5jb20+CkRhdGU6IEZyaSwgMTEgSnVsIDIwMTQgMTE6MDA6MDAgKzAyMDAKU3ViamVjdDogW1BB
VENIXSBhdGgxMGs6IHNraXAgZnJhbWVzIHdpdGggdGNwL2lwIGNoZWNrc3VtCgpTZWVtcyBGVyBk
b24ndCByZXBvcnQgRkNTIGVycm9ycyBjb3JyZWN0bHkuCkFzIGEgd29ya2Fyb3VuZCBjaGVjayB0
cGMvaXAgY2hlY2tzdW0gYWxzbwphbmQgcmVtb3ZlIGZyYW1lcyB3aXRoIHdyb25nIENSQy4KClNp
Z25lZC1vZmYtYnk6IEphbnVzeiBEemllZHppYyA8amFudXN6LmR6aWVkemljQHRpZXRvLmNvbT4K
LS0tCiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2h0dF9yeC5jIHwgICAyMiArKysr
KysrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBr
L2h0dF9yeC5jIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9odHRfcnguYwppbmRl
eCA5ZGVjOTZmLi4wY2I1YjQ0IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgv
YXRoMTBrL2h0dF9yeC5jCisrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvaHR0
X3J4LmMKQEAgLTg4Miw2ICs4ODIsNyBAQCBzdGF0aWMgdm9pZCBhdGgxMGtfaHR0X3J4X2Ftc2R1
KHN0cnVjdCBhdGgxMGtfaHR0ICpodHQsCiAJdW5zaWduZWQgaW50IGhkcl9sZW47CiAJc3RydWN0
IGFtc2R1X3N1YmZyYW1lX2hkciBzdWJmcmFtZV9oZHI7CiAJc3RydWN0IGllZWU4MDIxMV9yeF9z
dGF0dXMgKnN0YXR1czsKKwlpbnQgaXBfc3VtbWVkOwogCiAJcnhkID0gKHZvaWQgKilza2ItPmRh
dGEgLSBzaXplb2YoKnJ4ZCk7CiAJZW5jdHlwZSA9IE1TKF9fbGUzMl90b19jcHUocnhkLT5tcGR1
X3N0YXJ0LmluZm8wKSwKQEAgLTkwMiw3ICs5MDMsMTMgQEAgc3RhdGljIHZvaWQgYXRoMTBrX2h0
dF9yeF9hbXNkdShzdHJ1Y3QgYXRoMTBrX2h0dCAqaHR0LAogCQkJIFJYX01TRFVfU1RBUlRfSU5G
TzFfREVDQVBfRk9STUFUKTsKIAkJZGVjYXBfaGRyID0gKHZvaWQgKilyeGQtPnJ4X2hkcl9zdGF0
dXM7CiAKLQkJc2tiLT5pcF9zdW1tZWQgPSBhdGgxMGtfaHR0X3J4X2dldF9jc3VtX3N0YXRlKHNr
Yik7CisJCWlwX3N1bW1lZCA9IGF0aDEwa19odHRfcnhfZ2V0X2NzdW1fc3RhdGUoc2tiKTsKKwkJ
aWYgKGlwX3N1bW1lZCA9PSAtMSkgeworCQkJYXRoMTBrX2h0dF9yeF9mcmVlX21zZHVfY2hhaW4o
Zmlyc3QpOworCQkJcmV0dXJuOworCQl9CisKKwkJc2tiLT5pcF9zdW1tZWQgPSBpcF9zdW1tZWQ7
CiAKIAkJLyogRmlyc3QgZnJhbWUgaW4gYW4gQS1NU0RVIGNoYWluIGhhcyBtb3JlIGRlY2FwcGVk
IGRhdGEuICovCiAJCWlmIChza2IgPT0gZmlyc3QpIHsKQEAgLTk5OCw2ICsxMDA1LDcgQEAgc3Rh
dGljIHZvaWQgYXRoMTBrX2h0dF9yeF9tc2R1KHN0cnVjdCBhdGgxMGtfaHR0ICpodHQsCiAJZW51
bSBodHRfcnhfbXBkdV9lbmNyeXB0X3R5cGUgZW5jdHlwZTsKIAlpbnQgaGRyX2xlbjsKIAl2b2lk
ICpyZmMxMDQyOworCWludCBpcF9zdW1tZWQ7CiAKIAkvKiBUaGlzIHNob3VsZG4ndCBoYXBwZW4u
IElmIGl0IGRvZXMgdGhhbiBpdCBtYXkgYmUgYSBGVyBidWcuICovCiAJaWYgKHNrYi0+bmV4dCkg
ewpAQCAtMTAxNCw3ICsxMDIyLDEzIEBAIHN0YXRpYyB2b2lkIGF0aDEwa19odHRfcnhfbXNkdShz
dHJ1Y3QgYXRoMTBrX2h0dCAqaHR0LAogCWhkciA9IChzdHJ1Y3QgaWVlZTgwMjExX2hkciAqKXJ4
ZC0+cnhfaGRyX3N0YXR1czsKIAloZHJfbGVuID0gaWVlZTgwMjExX2hkcmxlbihoZHItPmZyYW1l
X2NvbnRyb2wpOwogCi0Jc2tiLT5pcF9zdW1tZWQgPSBhdGgxMGtfaHR0X3J4X2dldF9jc3VtX3N0
YXRlKHNrYik7CisJaXBfc3VtbWVkID0gYXRoMTBrX2h0dF9yeF9nZXRfY3N1bV9zdGF0ZShza2Ip
OworCWlmIChpcF9zdW1tZWQgPT0gLTEpIHsKKwkJYXRoMTBrX2h0dF9yeF9mcmVlX21zZHVfY2hh
aW4oc2tiKTsKKwkJcmV0dXJuOworCX0KKworCXNrYi0+aXBfc3VtbWVkID0gaXBfc3VtbWVkOwog
CiAJc3dpdGNoIChmbXQpIHsKIAljYXNlIFJYX01TRFVfREVDQVBfUkFXOgpAQCAtMTA4Myw5ICsx
MDk3LDkgQEAgc3RhdGljIGludCBhdGgxMGtfaHR0X3J4X2dldF9jc3VtX3N0YXRlKHN0cnVjdCBz
a19idWZmICpza2IpCiAJaWYgKCFpc190Y3AgJiYgIWlzX3VkcCkKIAkJcmV0dXJuIENIRUNLU1VN
X05PTkU7CiAJaWYgKCFpcF9jc3VtX29rKQotCQlyZXR1cm4gQ0hFQ0tTVU1fTk9ORTsKKwkJcmV0
dXJuIC0xOwogCWlmICghdGNwdWRwX2NzdW1fb2spCi0JCXJldHVybiBDSEVDS1NVTV9OT05FOwor
CQlyZXR1cm4gLTE7CiAKIAlyZXR1cm4gQ0hFQ0tTVU1fVU5ORUNFU1NBUlk7CiB9Ci0tIAoxLjcu
OS41Cgo=
--001a11c366a6beb3b904fde774a2
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--001a11c366a6beb3b904fde774a2--
