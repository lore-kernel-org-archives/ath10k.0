Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x234.google.com ([2a00:1450:4010:c04::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X44K6-000834-BD
 for ath10k@lists.infradead.org; Mon, 07 Jul 2014 08:30:56 +0000
Received: by mail-lb0-f180.google.com with SMTP id w7so2630865lbi.11
 for <ath10k@lists.infradead.org>; Mon, 07 Jul 2014 01:30:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJ-Vmo=JKpnoU2p4swTiXeTM0Q2LYWo7-VW_-vnOLb4ufVSO5A@mail.gmail.com>
References: <CABnBrYU3P5qXd7pE7LJ_K4JeNFLtbZnpsTgvqtpdMs07qz_gGA@mail.gmail.com>
 <CA+BoTQk_YtrHrR6Wi3mMAZxT6EHFBxdUAafp48GqfUcM=HwfZg@mail.gmail.com>
 <CABnBrYXn0T=bW45zR5VivFRhP4BqFswYY93hrjB7rx+azKX9uA@mail.gmail.com>
 <CABnBrYUTKdvUiDha3meiiu08BCqNVBuCgXb7M_Gr4DwhyON3qw@mail.gmail.com>
 <CAJ-Vmo=JKpnoU2p4swTiXeTM0Q2LYWo7-VW_-vnOLb4ufVSO5A@mail.gmail.com>
Date: Mon, 7 Jul 2014 10:30:28 +0200
Message-ID: <CALhHN=r9_3i3R45Exs59d02XRTa-07WWvBwmGY9pEKufZb3Byw@mail.gmail.com>
Subject: Re: A-MSDU reception not working?
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Content-Type: multipart/mixed; boundary=001a11336420a3048804fd96492b
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Denton Gentry <denton.gentry@gmail.com>

--001a11336420a3048804fd96492b
Content-Type: text/plain; charset=UTF-8

On 6 July 2014 04:27, Adrian Chadd <adrian@freebsd.org> wrote:
> I think you may have to tell mac80211 that it's okay and not to drop the frames.
>
> The earlier atheros chips would just give you the AMSDU frames as
> deaggregated A-MPDU sub-frames - you'd just pass the A-MSDU up to
> net80211 and it'd ull it apart. But if the driver is doing it (or,
> well, the chip is doing it) then mac80211 needs to know not to drop
> those sub-frames.
>
> I wonder if you'll ever get notified before the complete A-MPDU has
> been received. That happens on previous chips. eg, you have an A-MPDU
> of 16 frames with 4 MSDUs in each MPDU. If you get notified and handle
> half of one MPDU before you hit EOL, the next notification you process
> will be the next MSDU in the same MPDU - and then you'll hit the
> reordering hilarity again.
>
> So hm, i will face the same issue in FreeBSD at some point, so I'd
> likely do what you're thinking of doing - pass up a chain of mbufs
> representing the current MPDU and treat the whole lot as the frame(s)
> to care about. Honestly though, I'm kind of wondering whether I should
> mostly just do what the Atheros reference driver does and treat it as
> ethernet payload frames (ie, it's already de-encapsulated and the
> reordering is already done) and just tack on the wifi header bit via
> another of the DMA rings.
>
> Ugh, I really should sit down and write the FreeBSD version of this.
>
>
>
> -a
>
> (I'm still having flashbacks from working on this firmware at QCA. Aiee.)
>
>
> On 5 July 2014 06:55, Denton Gentry <denton.gentry@gmail.com> wrote:
>> There are two issues in handling the dis-aggregated A-MSDU subframes
>> in ieee80211_sta_manage_reorder_buf:
>>
>> 1. The out-of-date check:
>>
>>         /* frame with out of date sequence number */
>>         if (ieee80211_sn_less(mpdu_seq_num, head_seq_num)) {
>>                 dev_kfree_skb(skb);
>>                 goto out;
>>         }
>>
>> As all of the subframes carry the same sequence number, the first
>> subframe will be delivered and increment head_seq_num and then all
>> subsequent subframes will be discarded.
>>
>>
>> 2. The duplicates check a bit later in the routine:
>>
>>         /* check if we already stored this frame */
>>         if (tid_agg_rx->reorder_buf[index]) {
>>                 dev_kfree_skb(skb);
>>                 goto out;
>>         }
>>
>> If there is enough packet loss that packets are queued in the reorder
>> buffer and not immediately released, then only the first subframe will
>> be stored. Subsequent subframes will be discarded as duplicates.
>>
>>
>> An 802.11ac MacBook is able to get about 170 Mbps with iperf prior to
>> the reordering buffer changes, and dropped to about 8 Mbps with the
>> reorder buffer. Hacking around the out-of-date sequence number check
>> to allow all subframes to egress restores it to 170 Mbps.
>>
>> In the area where I'm testing there isn't enough 5 GHz noise to make
>> the duplicates-check issue happen very often. By adding a printk I can
>> see that it does happen, but it doesn't impact the throughput and I
>> can't report the impact of fixing it.
>>
>> ----
>>
>> I do wonder if both of these are symptoms of dis-aggregating the
>> A-MSDU too early. mac80211 expects to be dealing with the whole MPDU
>> at a time, and the ath10k A-MSDU case is sending it subframes instead.
>> Trying to make the ath10k code send up all of the subframes as a chain
>> of skbs didn't immediately work, but I do wonder if that would better
>> match the mac80211 expectations.
>>
>>
>>
>> On Fri, Jul 4, 2014 at 11:58 AM, Denton Gentry <denton.gentry@gmail.com> wrote:
>>> Yes, after some more testing it does look like an unfortunate
>>> interaction between the reorder buffer and A-MSDU. The disaggregated
>>> subframes all carry the same sequence number. The first subframe is
>>> released from the reorder buffer and increments the head_seq_num.
>>> Subsequent subframes are all discarded as being out of date.
>>>
>>> [  308.514021] ieee80211_sta_manage_reorder_buf: out of date seq=0xb05
>>> head=0xb06
>>> [  308.520577] ieee80211_sta_manage_reorder_buf: out of date seq=0xb0a
>>> head=0xb0b
>>> [  308.527198] ieee80211_sta_manage_reorder_buf: out of date seq=0xb0f
>>> head=0xb10
>>> [  308.533857] ieee80211_sta_manage_reorder_buf: out of date seq=0xb14
>>> head=0xb15
>>> [  308.540480] ieee80211_sta_manage_reorder_buf: out of date seq=0xb19
>>> head=0xb1a
>>> [  308.547730] ieee80211_sta_manage_reorder_buf: out of date seq=0xb1e
>>> head=0xb1f
>>> [  308.554069] ieee80211_sta_manage_reorder_buf: out of date seq=0xb23
>>> head=0xb24
>>>
>>>
>>> On Wed, Jul 2, 2014 at 9:49 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
>>>> On 30 June 2014 22:15, Denton Gentry <denton.gentry@gmail.com> wrote:
>>>>> In iperf tests using a MacBook STA bridging through an ath10k AP to an
>>>>> Ethernet server, I'm noticing very selective packet loss. The second
>>>>> and subsequent frames in an A-MSDU packet appear to be dropped.
>>>>>
>>>>> The AP sets the A-MSDU size to 3839 bytes, and the MacBook frequently
>>>>> sends A-MSDU packets containing two TCP frames. So far as I can tell,
>>>>> the first TCP frame from an A-MSDU aggregate is delivered and the
>>>>> second is consistently lost. The MacBook generally retransmits the
>>>>> lost frame as a singleton with no aggregation, and the retransmitted
>>>>> frame makes it through.
>>>>>
>>>>> This became more noticeable after the reordering fixes in
>>>>> http://lists.infradead.org/pipermail/ath10k/2014-June/002552.html
>>>>>
>>>>> I see this A-MSDU packet loss behavior both with and without the
>>>>> reordering fixes, the first packet in an A-MSDU is delivered while the
>>>>> second is dropped. However, *without* the reordering fixes (and
>>>>> therefore with packets delivered out of order) the MacBook sends
>>>>> relatively few A-MSDU frames. *With* the reordering fixes, so all
>>>>> packets are delivered in order, the MacBook keeps sending A-MSDU and
>>>>> therefore has to deal with more packet loss. I suspect it is an
>>>>> interaction with the MacOS TCP congestion window which I'm likely
>>>>> never going to fully understand, its stuck in a region of the
>>>>> congestion window where the Wifi driver keeps choosing to using
>>>>> A-MSDU.
>>>>
>>>> I was actually worried about A-MSDU once A-MPDU re-ordering issue was raised.
>>>>
>>>> ath10k fw reports A-MSDU subframes separately. To avoid memory
>>>> copying/allocation overhead each subframe is reported as a singly
>>>> A-MSDU MSDU to mac80211 with an extra rx_flag AMSDU_MORE. Perhaps
>>>> A-MPDU reordering intereferes with A-MSDU now?
>>>>
Denton could you try attached patch: report amsdu in one big frame.
If help, we can add amsdu skb list support to mac80211/cfg80211 - to
improve performance and reduce memcpy, while currently we have skb
frames, put them in one big skb and next cfg80211 split them again
into msdus and report to stack.

BR
Janusz

--001a11336420a3048804fd96492b
Content-Type: text/x-diff; charset=US-ASCII; 
	name="0001-ath10k-amsdu-rx-buid-one-big-frame.patch"
Content-Disposition: attachment; 
	filename="0001-ath10k-amsdu-rx-buid-one-big-frame.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hxbixyp70

RnJvbSA1YTE3NjE2MTVjNWJjODE5NjM5NzEwMDQ0ZTVkZDcyODg5ZmJiY2U2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKYW51c3ogRHppZWR6aWMgPGphbnVzei5kemllZHppY0B0aWV0
by5jb20+CkRhdGU6IFN1biwgNiBKdWwgMjAxNCAxMDoxODowNiArMDIwMApTdWJqZWN0OiBbUkZD
L1JGVF0gYXRoMTBrOiBhbXNkdSByeCwgYnVpZCBvbmUgYmlnIGZyYW1lCgpUZW1wb3JhcnkgcGF0
Y2gsIHRvIGNoZWNrIGlmIHdpbGwgc29sdmUgYW1wZHUgcmVvcmRlcmluZyBpc3N1ZS4KClNpZ25l
ZC1vZmYtYnk6IEphbnVzeiBEemllZHppYyA8amFudXN6LmR6aWVkemljQHRpZXRvLmNvbT4KLS0t
CiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2h0dF9yeC5jIHwgICA3MiArKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCsp
LCAyMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgv
YXRoMTBrL2h0dF9yeC5jIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9odHRfcngu
YwppbmRleCA1N2Q1YTk3Li4yNTUzZjUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC93aXJlbGVz
cy9hdGgvYXRoMTBrL2h0dF9yeC5jCisrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgx
MGsvaHR0X3J4LmMKQEAgLTg3NCwxMiArODc0LDE1IEBAIHN0YXRpYyB2b2lkIGF0aDEwa19odHRf
cnhfYW1zZHUoc3RydWN0IGF0aDEwa19odHQgKmh0dCwKIHsKIAlzdHJ1Y3QgaHR0X3J4X2Rlc2Mg
KnJ4ZDsKIAlzdHJ1Y3Qgc2tfYnVmZiAqc2tiID0gc2tiX2luOwotCXN0cnVjdCBza19idWZmICpm
aXJzdDsKKwlzdHJ1Y3Qgc2tfYnVmZiAqZmlyc3QsICpmcmFtZSA9IE5VTEwsICp0bXA7CiAJZW51
bSByeF9tc2R1X2RlY2FwX2Zvcm1hdCBmbXQ7CiAJZW51bSBodHRfcnhfbXBkdV9lbmNyeXB0X3R5
cGUgZW5jdHlwZTsKIAlzdHJ1Y3QgaWVlZTgwMjExX2hkciAqaGRyOwotCXU4IGhkcl9idWZbNjRd
LCBhZGRyW0VUSF9BTEVOXSwgKnFvczsKKwl1OCBoZHJfYnVmWzY0XSwgYWRkcltFVEhfQUxFTl07
CiAJdW5zaWduZWQgaW50IGhkcl9sZW47CisJc3RydWN0IGFtc2R1X3N1YmZyYW1lX2hkciBzdWJm
cmFtZV9oZHI7CisJdW5zaWduZWQgaW50IHNpemUgPSAwOworCXU4IHBhZGRpbmc7CiAKIAlyeGQg
PSAodm9pZCAqKXNrYi0+ZGF0YSAtIHNpemVvZigqcnhkKTsKIAllbmN0eXBlID0gTVMoX19sZTMy
X3RvX2NwdShyeGQtPm1wZHVfc3RhcnQuaW5mbzApLApAQCAtODkwLDYgKzg5MywyMiBAQCBzdGF0
aWMgdm9pZCBhdGgxMGtfaHR0X3J4X2Ftc2R1KHN0cnVjdCBhdGgxMGtfaHR0ICpodHQsCiAJbWVt
Y3B5KGhkcl9idWYsIGhkciwgaGRyX2xlbik7CiAJaGRyID0gKHN0cnVjdCBpZWVlODAyMTFfaGRy
ICopaGRyX2J1ZjsKIAorCS8qIENoZWNrIHNpemUgd2Ugd2lsbCBuZWVkICovCisJdG1wID0gc2ti
X2luOworCXdoaWxlICh0bXApIHsKKwkJc2l6ZSA9IHNpemUgKyB0bXAtPmxlbjsKKwkJdG1wID0g
dG1wLT5uZXh0OworCX0KKworCWZyYW1lID0gYWxsb2Nfc2tiKHNpemUgKyBza2JfaGVhZHJvb20o
c2tiX2luKSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFmcmFtZSkgeworCQlkZXZfa2ZyZWVfc2tiX2Fu
eShza2JfaW4pOworCQlyZXR1cm47CisJfQorCisJc2tiX3Jlc2VydmUoZnJhbWUsIHNrYl9oZWFk
cm9vbShza2JfaW4pKTsKKwlmcmFtZS0+ZGV2ID0gc2tiX2luLT5kZXY7CisKIAlmaXJzdCA9IHNr
YjsKIAl3aGlsZSAoc2tiKSB7CiAJCXZvaWQgKmRlY2FwX2hkcjsKQEAgLTkyMiwxOSArOTQxLDI4
IEBAIHN0YXRpYyB2b2lkIGF0aDEwa19odHRfcnhfYW1zZHUoc3RydWN0IGF0aDEwa19odHQgKmh0
dCwKIAkJCW1lbWNweShhZGRyLCBpZWVlODAyMTFfZ2V0X0RBKGhkciksIEVUSF9BTEVOKTsKIAkJ
CXNrYl9wdWxsKHNrYiwgaGRyX2xlbik7CiAKLQkJCS8qIHB1c2ggb3JpZ2luYWwgODAyLjExIGhl
YWRlciAqLwotCQkJaGRyID0gKHN0cnVjdCBpZWVlODAyMTFfaGRyICopaGRyX2J1ZjsKLQkJCWhk
cl9sZW4gPSBpZWVlODAyMTFfaGRybGVuKGhkci0+ZnJhbWVfY29udHJvbCk7Ci0JCQltZW1jcHko
c2tiX3B1c2goc2tiLCBoZHJfbGVuKSwgaGRyLCBoZHJfbGVuKTsKKwkJCS8qIGNmZzgwMjExIGV4
cGVjdCB0aGlzIHBhZGRpbmcgKi8KKwkJCXBhZGRpbmcgPSAoNCAtIChza2ItPmxlbiArIHNpemVv
ZihzdWJmcmFtZV9oZHIpKSkgJiAweDM7CisJCQlza2JfcHV0KHNrYiwgcGFkZGluZyk7CiAKLQkJ
CS8qIG9yaWdpbmFsIEEtTVNEVSBoZWFkZXIgaGFzIHRoZSBiaXQgc2V0IGJ1dCB3ZSdyZQotCQkJ
ICogbm90IGluY2x1ZGluZyBBLU1TRFUgc3ViZnJhbWUgaGVhZGVyICovCi0JCQloZHIgPSAoc3Ry
dWN0IGllZWU4MDIxMV9oZHIgKilza2ItPmRhdGE7Ci0JCQlxb3MgPSBpZWVlODAyMTFfZ2V0X3Fv
c19jdGwoaGRyKTsKLQkJCXFvc1swXSAmPSB+SUVFRTgwMjExX1FPU19DVExfQV9NU0RVX1BSRVNF
TlQ7CisJCQkvKiBidWlsZCBhbXNkdSBzdWJmcmFtZSBoZWFkZXIgKi8KKwkJCW1lbWNweSgmc3Vi
ZnJhbWVfaGRyLmRzdCwgYWRkciwgRVRIX0FMRU4pOworCQkJbWVtY3B5KCZzdWJmcmFtZV9oZHIu
c3JjLCBpZWVlODAyMTFfZ2V0X1NBKGhkciksIEVUSF9BTEVOKTsKKwkJCXN1YmZyYW1lX2hkci5s
ZW4gPSBfX2NwdV90b19iZTE2KHNrYi0+bGVuKSA7CiAKLQkJCS8qIG9yaWdpbmFsIDgwMi4xMSBo
ZWFkZXIgaGFzIGEgZGlmZmVyZW50IERBICovCi0JCQltZW1jcHkoaWVlZTgwMjExX2dldF9EQSho
ZHIpLCBhZGRyLCBFVEhfQUxFTik7CisJCQkvKiBwdXNoIGJhY2sgYW1zZHUgaGRyICovCisJCQlt
ZW1jcHkoc2tiX3B1c2goc2tiLCBzaXplb2Yoc3ViZnJhbWVfaGRyKSksICZzdWJmcmFtZV9oZHIs
CisJCQkgICAgICAgc2l6ZW9mKHN1YmZyYW1lX2hkcikpOworCisJCQlpZiAoc2tiID09IGZpcnN0
KSB7CisJCQkJLyogcHVzaCBiYWNrIG9yZ2luYWwgODAyMTEgaGVhZGVyICovCisJCQkJaGRyID0g
KHN0cnVjdCBpZWVlODAyMTFfaGRyICopaGRyX2J1ZjsKKwkJCQloZHJfbGVuID0gaWVlZTgwMjEx
X2hkcmxlbihoZHItPmZyYW1lX2NvbnRyb2wpOworCQkJCW1lbWNweShza2JfcHVzaChza2IsIGhk
cl9sZW4pLCBoZHIsIGhkcl9sZW4pOworCisJCQkJLyogb3JpZ2luYWwgODAyLjExIGhlYWRlciBo
YXMgYSBkaWZmZXJlbnQgREEgKi8KKwkJCQltZW1jcHkoaWVlZTgwMjExX2dldF9EQShoZHIpLCBh
ZGRyLCBFVEhfQUxFTik7CisJCQl9CiAJCQlicmVhazsKIAkJY2FzZSBSWF9NU0RVX0RFQ0FQX0VU
SEVSTkVUMl9ESVg6CiAJCQkvKiBzdHJpcCBldGhlcm5ldCBoZWFkZXIgYW5kIGluc2VydCBkZWNh
cHBlZCA4MDIuMTEKQEAgLTk1NiwxOSArOTg0LDIxIEBAIHN0YXRpYyB2b2lkIGF0aDEwa19odHRf
cnhfYW1zZHUoc3RydWN0IGF0aDEwa19odHQgKmh0dCwKIAkJfQogCiAJCXNrYl9pbiA9IHNrYjsK
LQkJYXRoMTBrX2h0dF9yeF9oX3Byb3RlY3RlZChodHQsIHJ4X3N0YXR1cywgc2tiX2luLCBlbmN0
eXBlLCBmbXQsCi0JCQkJCSAgZmFsc2UpOworCisJCWlmIChza2JfaW4gPT0gZmlyc3QpCisJCQlh
dGgxMGtfaHR0X3J4X2hfcHJvdGVjdGVkKGh0dCwgcnhfc3RhdHVzLCBza2JfaW4sCisJCQkJCQkg
IGVuY3R5cGUsIGZtdCwgZmFsc2UpOworCisJCW1lbWNweShza2JfcHV0KGZyYW1lLCBza2JfaW4t
PmxlbiksIHNrYl9pbi0+ZGF0YSwgc2tiX2luLT5sZW4pOworCiAJCXNrYiA9IHNrYi0+bmV4dDsK
IAkJc2tiX2luLT5uZXh0ID0gTlVMTDsKIAotCQlpZiAoc2tiKQotCQkJcnhfc3RhdHVzLT5mbGFn
IHw9IFJYX0ZMQUdfQU1TRFVfTU9SRTsKLQkJZWxzZQotCQkJcnhfc3RhdHVzLT5mbGFnICY9IH5S
WF9GTEFHX0FNU0RVX01PUkU7Ci0KLQkJYXRoMTBrX3Byb2Nlc3NfcngoaHR0LT5hciwgcnhfc3Rh
dHVzLCBza2JfaW4pOworCQkvKiBXZSBkb24ndCBuZWVkIHRoaXMgc2tiIGFueW1vcmUgKi8KKwkJ
ZGV2X2tmcmVlX3NrYihza2JfaW4pOwogCX0KIAorCWF0aDEwa19wcm9jZXNzX3J4KGh0dC0+YXIs
IHJ4X3N0YXR1cywgZnJhbWUpOwogCS8qIEZJWE1FOiBJdCBtaWdodCBiZSBuaWNlIHRvIHJlLWFz
c2VtYmxlIHRoZSBBLU1TRFUgd2hlbiB0aGVyZSdzIGEKIAkgKiBtb25pdG9yIGludGVyZmFjZSBh
Y3RpdmUgZm9yIHNuaWZmaW5nIHB1cnBvc2VzLiAqLwogfQotLSAKMS43LjkuNQoK
--001a11336420a3048804fd96492b
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--001a11336420a3048804fd96492b--
