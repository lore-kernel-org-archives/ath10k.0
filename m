Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJaQ3-0003uD-Ct
 for ath10k@lists.infradead.org; Mon, 05 Nov 2018 08:39:36 +0000
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=_a753dfe68d970f93e2816b28d5c38b19"
Date: Mon, 05 Nov 2018 00:39:23 -0800
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH 3/6] mac80211: Add airtime accounting and scheduling to
 TXQs
In-Reply-To: <87h8gzpy9t.fsf@toke.dk>
References: <1540033534-11211-1-git-send-email-rmanohar@codeaurora.org>
 <1540033534-11211-4-git-send-email-rmanohar@codeaurora.org>
 <8736ssbxp9.fsf@toke.dk> <9c2b790132a9a89fecd7dd79dc67d891@codeaurora.org>
 <87woq2843q.fsf@toke.dk> <8fd3524bfe022ccd2a8b61a3314ed32b@codeaurora.org>
 <5d8415fe50e8505eb62c5a0d1b40bb2a@codeaurora.org> <87h8gzpy9t.fsf@toke.dk>
Message-ID: <10b644b6c7f436a892e3e9f4fd5e179d@codeaurora.org>
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
To: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

--=_a753dfe68d970f93e2816b28d5c38b19
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"; format="flowed"

On 2018-11-02 03:30, Toke Høiland-Jørgensen wrote:
> Rajkumar Manoharan <rmanohar@codeaurora.org> writes:
> 
>> On 2018-10-28 15:01, Rajkumar Manoharan wrote:
>>> On 2018-10-28 08:48, Toke Høiland-Jørgensen wrote:
>>>> Rajkumar Manoharan <rmanohar@codeaurora.org> writes:
>>>> 
>>>>> 
>>>>> 4ms         223 (40%)         214 (40%)    109 (10%)       94 (10%)
>>>>> 
>>>>> 4ms         337 (90%)         182 (8%)      23 (1%)        30 (1%)
>>>> 
>>>> So this looks like it's doing *something*, but not like it's
>>>> succeeding
>>>> in achieving the set percentages. Did you check if the actual 
>>>> airtime
>>>> values (in debugfs) corresponds to the configured weights?
>>>> 
>>> No. Will check that.
>>> 
>> Toke,
>> 
>>  From above results, different airtime for each station is reflecting 
>> on
>> output performance. Unfortunately I don't see such tput difference, 
>> when
>> the tx mode is fixed in push-only. Even low weight station is giving
>> same
>> performance. Are you also seeing the same behavior in your setup? 
>> Could
>> you please share your results?
> 
> Sorry, I've been travelling this week; I'll be back in the office next
> week and can run some tests then. I may also have an idea for a
> different algorithm that will work better in pull mode, but need to see
> if it works at all first :)
> 
Wow... :)

Meanwhile we did some more experiments with both modes. The experiment 
was
done in open environment and fixed rate and UDP traffic ran for 60 
seconds.

Seems like push mode not honoring the configured weight. Always the 
airtime
was almost same whereas in pull-mode airtime is changing based on 
configured
weight. Hence I would like to know your results.

		sta1		sta2		sta3		sta4
pull-mode	8s(205us)	18s(3.2ms)	8s(205us)	14s(410us)
		12s(256us)	12s(256us)	13s(256us)	12s(256us)
		14s(4ms)	13s(4ms)	14s(4ms)	13s(4ms)

push-mode	15s(205us)	12s(3.2ms)	16s(205us)	12s(410us)
		15s(256us)	12s(256us)	16s(256us)	12s(256us)
		14s(4ms)	13s(4ms)	16s(4ms)	12s(4ms)


> How do I force ath10k into push mode?
> 
Attaching the change to fix push mode.

-Rajkumar
--=_a753dfe68d970f93e2816b28d5c38b19
Content-Transfer-Encoding: base64
Content-Type: text/x-diff;
 name=push-only.patch
Content-Disposition: attachment;
 filename=push-only.patch;
 size=2239

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvY29yZS5jIGIvZHJp
dmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9jb3JlLmMKaW5kZXggYzhkYmJmYTkwMWFmLi4x
OTgxZTBlYThjN2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsv
Y29yZS5jCisrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvY29yZS5jCkBAIC00
MSw2ICs0MSw3IEBACiBzdGF0aWMgYm9vbCB1YXJ0X3ByaW50Owogc3RhdGljIGJvb2wgc2tpcF9v
dHA7CiBzdGF0aWMgYm9vbCByYXdtb2RlOworYm9vbCBwZWVyX2Zsb3dfY3RsID0gZmFsc2U7CiAK
IHVuc2lnbmVkIGxvbmcgYXRoMTBrX2NvcmVkdW1wX21hc2sgPSBCSVQoQVRIMTBLX0ZXX0NSQVNI
X0RVTVBfUkVHSVNURVJTKSB8CiAJCQkJICAgICBCSVQoQVRIMTBLX0ZXX0NSQVNIX0RVTVBfQ0Vf
REFUQSk7CkBAIC01Miw2ICs1Myw3IEBACiBtb2R1bGVfcGFyYW0oc2tpcF9vdHAsIGJvb2wsIDA2
NDQpOwogbW9kdWxlX3BhcmFtKHJhd21vZGUsIGJvb2wsIDA2NDQpOwogbW9kdWxlX3BhcmFtX25h
bWVkKGNvcmVkdW1wX21hc2ssIGF0aDEwa19jb3JlZHVtcF9tYXNrLCB1bG9uZywgMDQ0NCk7Citt
b2R1bGVfcGFyYW0ocGVlcl9mbG93X2N0bCwgYm9vbCwgMDY0NCk7CiAKIE1PRFVMRV9QQVJNX0RF
U0MoZGVidWdfbWFzaywgIkRlYnVnZ2luZyBtYXNrIik7CiBNT0RVTEVfUEFSTV9ERVNDKHVhcnRf
cHJpbnQsICJVYXJ0IHRhcmdldCBkZWJ1Z2dpbmciKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0
L3dpcmVsZXNzL2F0aC9hdGgxMGsvY29yZS5oIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0
aDEway9jb3JlLmgKaW5kZXggZTZmNTk3ZDlmMjI2Li5iZjJlNzA0MTFkOTAgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvY29yZS5oCisrKyBiL2RyaXZlcnMvbmV0
L3dpcmVsZXNzL2F0aC9hdGgxMGsvY29yZS5oCkBAIC0xMjAxLDYgKzEyMDEsNyBAQCBzdGF0aWMg
aW5saW5lIGJvb2wgYXRoMTBrX3BlZXJfc3RhdHNfZW5hYmxlZChzdHJ1Y3QgYXRoMTBrICphcikK
IH0KIAogZXh0ZXJuIHVuc2lnbmVkIGxvbmcgYXRoMTBrX2NvcmVkdW1wX21hc2s7CitleHRlcm4g
Ym9vbCBwZWVyX2Zsb3dfY3RsOwogCiBzdHJ1Y3QgYXRoMTBrICphdGgxMGtfY29yZV9jcmVhdGUo
c2l6ZV90IHByaXZfc2l6ZSwgc3RydWN0IGRldmljZSAqZGV2LAogCQkJCSAgZW51bSBhdGgxMGtf
YnVzIGJ1cywKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvbWFj
LmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL21hYy5jCmluZGV4IGQ3NGI1NWJh
OTkxNC4uZDVhZDg4Yjg1YjY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgv
YXRoMTBrL21hYy5jCisrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvbWFjLmMK
QEAgLTIxNiw2ICsyMTYsOSBAQCBpbnQgYXRoMTBrX21hY19leHRfcmVzb3VyY2VfY29uZmlnKHN0
cnVjdCBhdGgxMGsgKmFyLCB1MzIgdmFsKQogCWVsc2UKIAkJcGxhdGZvcm1fdHlwZSA9IFdNSV9I
T1NUX1BMQVRGT1JNX0hJR0hfUEVSRjsKIAorCWlmICghcGVlcl9mbG93X2N0bCkKKwkJcGxhdGZv
cm1fdHlwZSA9IFdNSV9IT1NUX1BMQVRGT1JNX0xPV19QRVJGX05PX0ZFVENIOworCiAJcmV0ID0g
YXRoMTBrX3dtaV9leHRfcmVzb3VyY2VfY29uZmlnKGFyLCBwbGF0Zm9ybV90eXBlLCB2YWwpOwog
CiAJaWYgKHJldCAmJiByZXQgIT0gLUVPUE5PVFNVUFApIHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvd21pLmggYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgv
YXRoMTBrL3dtaS5oCmluZGV4IGY3YmFkZDA3OTA1MS4uNjk1OGQ0ZjU4YTIxIDEwMDY0NAotLS0g
YS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3dtaS5oCisrKyBiL2RyaXZlcnMvbmV0
L3dpcmVsZXNzL2F0aC9hdGgxMGsvd21pLmgKQEAgLTcxMjgsNiArNzEyOCw3IEBAIHN0cnVjdCB3
bWlfcG5vX3NjYW5fcmVxIHsKIGVudW0gd21pX2hvc3RfcGxhdGZvcm1fdHlwZSB7CiAJV01JX0hP
U1RfUExBVEZPUk1fSElHSF9QRVJGLAogCVdNSV9IT1NUX1BMQVRGT1JNX0xPV19QRVJGLAorCVdN
SV9IT1NUX1BMQVRGT1JNX0xPV19QRVJGX05PX0ZFVENILAogfTsKIAogZW51bSB3bWlfYnNzX3N1
cnZleV9yZXFfdHlwZSB7Cg==
--=_a753dfe68d970f93e2816b28d5c38b19
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--=_a753dfe68d970f93e2816b28d5c38b19--
