Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x236.google.com ([2607:f8b0:400c:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKmiI-0007Cm-1O
 for ath10k@lists.infradead.org; Tue, 04 Mar 2014 10:36:42 +0000
Received: by mail-ve0-f182.google.com with SMTP id jw12so2738778veb.41
 for <ath10k@lists.infradead.org>; Tue, 04 Mar 2014 02:36:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQm6CROYAY6nH6_bJo=1McTG8_7Q7byg-Yf8Ci0Q4v6jMw@mail.gmail.com>
References: <CAEFj9874KjsRfC1rK5X1wWpQ-1hCt44tOLj5q+adWWLUbuyE0g@mail.gmail.com>
 <CA+BoTQnS1veOHepWtAsM2HfdKAAgtAoHganHHKo1VyBEowyJ6A@mail.gmail.com>
 <CAEFj986yq_K3iu6K8mzvfPjYmuULEZEPuRDOua2iLFTRimkuFA@mail.gmail.com>
 <CALhHN=p+dyQsnbc4+sDjqoHysnak4Uq3KYEkyCT-BDXvHPszCw@mail.gmail.com>
 <CAEFj984xXPrLQu+pjt6jSyuYT-hn3uM8fLj1UmhhJfF7K_=taA@mail.gmail.com>
 <CA+BoTQ=Q86r4E-CaHCmmxrkQJcHH_ZeaB2-e534KOQvSOgMcjA@mail.gmail.com>
 <CAEFj9844cE+XcS4zTVD8hf4eVrk_v=8xisc7vUBzwsnzm-ARwg@mail.gmail.com>
 <CA+BoTQm6CROYAY6nH6_bJo=1McTG8_7Q7byg-Yf8Ci0Q4v6jMw@mail.gmail.com>
Date: Tue, 4 Mar 2014 18:36:20 +0800
Message-ID: <CAEFj9850K2V9jOV0D_tQHb57DJRZ7ZMD0_GovY+B_VPNxP=maQ@mail.gmail.com>
Subject: Re: Only Lowest Legacy Rate 6Mbps used by Adhoc Mode
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Content-Type: multipart/mixed; boundary=047d7b676bf895324604f3c57979
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

--047d7b676bf895324604f3c57979
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Attached is the dump file of the command. Let me know whether this is
sufficient.

-----
Chun-Yeow


On Tue, Mar 4, 2014 at 5:56 PM, Michal Kazior <michal.kazior@tieto.com> wro=
te:
> On 4 March 2014 10:51, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
>>> Hmm.. if I assume ath10k_sta_state() isn't called for AUTH->ASSOC
>>> (which probably isn't unreasonable to consider since IBSS doesn't have
>>> an association sequence, does it?) then ath10k_station_assoc() isn't
>>> called and neither is ath10k_wmi_peer_assoc() which I suspect setups
>>> HW rate control.
>>
>> Nope, the mac80211 will move the STA state to AUTH and ASSOC when the
>> STA is added but as legacy STA. So ath10k_station_assoc is called as
>> shown below:
>>
>> [ 445.080000] ath10k: mac vdev 0 peer create 04:f0:21:0c:a5:44 (new
>> sta) num_peers 2
>> [  445.080000] ath10k: wmi peer create vdev_id 0 peer_addr 04:f0:21:0c:a=
5:44
>> [  445.080000] ath10k: mac sta 04:f0:21:0c:a5:44 associated
>> [  445.080000] ath10k: mac peer 04:f0:21:0c:a5:44 phymode 11a
>> --------> [first association with legacy]
>> [  445.080000] ath10k: wmi peer assoc vdev 0 addr 04:f0:21:0c:a5:44
>> [  445.160000] ath10k: mac sta rc update for 04:f0:21:0c:a5:44 changed
>> 00000004 bw 0 nss 1 smps 2
>> [ 445.160000] ath10k: mac sta rc update for 04:f0:21:0c:a5:44:
>> changing supported rates not implemented [upgrade the rate]
>> [ 445.170000] ath10k: wmi peer delete vdev_id 0 peer_addr
>> 04:f0:21:0c:a5:44 -----------> [delete peer]
>> [  445.170000] ath10k: wmi peer create vdev_id 0 peer_addr
>> 04:f0:21:0c:a5:44 -----------> [create peer]
>> [  445.170000] ath10k: mac ht peer 04:f0:21:0c:a5:44 mcs cnt 24 nss 1
>> [  445.170000] ath10k: mac peer 04:f0:21:0c:a5:44 phymode 11na-ht20
>> [  445.170000] ath10k: wmi peer assoc vdev 0 addr 04:f0:21:0c:a5:44
>> ------------> [associate peer again with HT]
>> [  445.170000] ath10k: wmi vdev 0 peer 0x04:f0:21:0c:a5:44 set param 1 v=
alue 1
>>
>> My further investigation shows that the rate control is working when
>> you added and associated the STA at first.
>>
>> Later on, mac80211 found out that the adhoc node can support HT or VHT
>> and try to call drv_sta_rc_update. But since the
>> IEEE80211_RC_SUPP_RATES_CHANGED is not implemented, I try to add the
>> code to disassoc -> delete -> create -> assoc the STA again. But the
>> rate control is no longer working (but you can fix the HT rate as
>> suggested by Janusz Dziedzic). So what went wrong?
>
> Perhaps FW doesn't support HT with IBSS at all?
>
> Can you get peer assoc command dump (after normal assoc and after rc
> update), please? I'm curious what actually gets sent to firmware.
>
>
> Micha=C5=82

--047d7b676bf895324604f3c57979
Content-Type: application/octet-stream; name=dump_adhoc
Content-Disposition: attachment; filename=dump_adhoc
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hsd1jybp0

WyAgIDcyLjExMDAwMF0gYXRoMTBrOiB3bWkgcGVlciBjcmVhdGUgdmRldl9pZCAwIHBlZXJfYWRk
ciAwNDpmMDoyMTowYzphNTo0NApbICAgNzIuMTEwMDAwXSBhdGgxMGs6IHBjaSB0eCBpdGVtIDAg
cGFkZHIgMHgwNzFkNWUzMCBsZW4gMjQgbl9pdGVtcyAxClsgICA3Mi4xMTAwMDBdIGl0ZW0gZGF0
YTogMDAwMDAwMDA6IDAyIDAxIDEwIDAwIDAwIGExIDAwIDAwIDAxIDYwIDAwIDAwIDAwIDAwIDAw
IDAwICAuLi4uLi4uLi5gLi4uLi4uClsgICA3Mi4xMTAwMDBdIGl0ZW0gZGF0YTogMDAwMDAwMTA6
IDA0IGYwIDIxIDBjIGE1IDQ0IDAwIDAwICAgICAgICAgICAgICAgICAgICAgICAgICAuLiEuLkQu
LgpbICAgNzIuMTEwMDAwXSBhdGgxMGs6IHdtaSBwZWVyIGFzc29jIHZkZXYgMCBhZGRyIDA0OmYw
OjIxOjBjOmE1OjQ0ClsgICA3Mi4xMTAwMDBdIGF0aDEwazogcGNpIHR4IGl0ZW0gMCBwYWRkciAw
eDA3Mzk4ODMwIGxlbiAzNjggbl9pdGVtcyAxClsgICA3Mi4xMTAwMDBdIGl0ZW0gZGF0YTogMDAw
MDAwMDA6IDAyIDAwIDY4IDAxIDA4IGEyIDAwIDAwIDA1IDYwIDAwIDAwIDA0IGYwIDIxIDBjICAu
LmguLi4uLi5gLi4uLiEuClsgICA3Mi4xMTAwMDBdIGl0ZW0gZGF0YTogMDAwMDAwMTA6IGE1IDQ0
IDAwIDAwIDAwIDAwIDAwIDAwIDAxIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAuRC4uLi4uLi4uLi4u
Li4uClsgICA3Mi4xMTAwMDBdIGl0ZW0gZGF0YTogMDAwMDAwMjA6IDAxIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDA1IDAwIDAwIDAwIDAwIDAwIDAwIDAwICAuLi4uLi4uLi4uLi4uLi4uClsgICA3Mi4x
MTAwMDBdIGl0ZW0gZGF0YTogMDAwMDAwMzA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDA4IDAwIDAwIDAwICAuLi4uLi4uLi4uLi4uLi4uClsgICA3Mi4xMTAwMDBdIGl0ZW0g
ZGF0YTogMDAwMDAwNDA6IDBjIDEyIDE4IDI0IDMwIDQ4IDYwIDZjIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwICAuLi4kMEhgbC4uLi4uLi4uClsgICA3Mi4xMTAwMDBdIGl0ZW0gZGF0YTogMDAwMDAw
NTA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAuLi4u
Li4uLi4uLi4uLi4uClsgICA3Mi4xMTAwMDBdIGl0ZW0gZGF0YTogMDAwMDAwNjA6IDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAuLi4uLi4uLi4uLi4uLi4u
ClsgICA3Mi4xMTAwMDBdIGl0ZW0gZGF0YTogMDAwMDAwNzA6IDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAuLi4uLi4uLi4uLi4uLi4uClsgICA3Mi4xMTAw
MDBdIGl0ZW0gZGF0YTogMDAwMDAwODA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwICAuLi4uLi4uLi4uLi4uLi4uClsgICA3Mi4xMTAwMDBdIGl0ZW0gZGF0
YTogMDAwMDAwOTA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwICAuLi4uLi4uLi4uLi4uLi4uClsgICA3Mi4xMTAwMDBdIGl0ZW0gZGF0YTogMDAwMDAwYTA6
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAuLi4uLi4u
Li4uLi4uLi4uClsgICA3Mi4xMTAwMDBdIGl0ZW0gZGF0YTogMDAwMDAwYjA6IDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAuLi4uLi4uLi4uLi4uLi4uClsg
ICA3Mi4xMTAwMDBdIGl0ZW0gZGF0YTogMDAwMDAwYzA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAuLi4uLi4uLi4uLi4uLi4uClsgICA3Mi4xMTAwMDBd
IGl0ZW0gZGF0YTogMDAwMDAwZDA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwICAuLi4uLi4uLi4uLi4uLi4uClsgICA3Mi4xMTAwMDBdIGl0ZW0gZGF0YTog
MDAwMDAwZTA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
ICAuLi4uLi4uLi4uLi4uLi4uClsgICA3Mi4xMTAwMDBdIGl0ZW0gZGF0YTogMDAwMDAwZjA6IDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAuLi4uLi4uLi4u
Li4uLi4uClsgICA3Mi4xMTAwMDBdIGl0ZW0gZGF0YTogMDAwMDAxMDA6IDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAuLi4uLi4uLi4uLi4uLi4uClsgICA3
Mi4xMTAwMDBdIGl0ZW0gZGF0YTogMDAwMDAxMTA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwICAuLi4uLi4uLi4uLi4uLi4uClsgICA3Mi4xMTAwMDBdIGl0
ZW0gZGF0YTogMDAwMDAxMjA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwICAuLi4uLi4uLi4uLi4uLi4uClsgICA3Mi4xMTAwMDBdIGl0ZW0gZGF0YTogMDAw
MDAxMzA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAu
Li4uLi4uLi4uLi4uLi4uClsgICA3Mi4xMTAwMDBdIGl0ZW0gZGF0YTogMDAwMDAxNDA6IDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAxIDAwIDAwIDAwICAuLi4uLi4uLi4uLi4u
Li4uClsgICA3Mi4xMTAwMDBdIGl0ZW0gZGF0YTogMDAwMDAxNTA6IDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAuLi4uLi4uLi4uLi4uLi4uClsgICA3Mi4x
MTAwMDBdIGl0ZW0gZGF0YTogMDAwMDAxNjA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwICAuLi4uLi4uLi4uLi4uLi4uCgpbICAgNzIuMTEwMDAwXSBhdGgx
MGs6IERpc2Fzc29jaWF0ZSwgZGVsZXRlLCBjcmVhdGUgYW5kIGFzc29jaWF0ZSBhZ2FpbgoKWyAg
IDcyLjEyMDAwMF0gYXRoMTBrOiB3bWkgcGVlciBkZWxldGUgdmRldl9pZCAwIHBlZXJfYWRkciAw
NDpmMDoyMTowYzphNTo0NApbICAgNzIuMTIwMDAwXSBhdGgxMGs6IHBjaSB0eCBpdGVtIDAgcGFk
ZHIgMHgwNzFkNTIzMCBsZW4gMjQgbl9pdGVtcyAxClsgICA3Mi4xMjAwMDBdIGl0ZW0gZGF0YTog
MDAwMDAwMDA6IDAyIDAxIDEwIDAwIDIwIGEzIDMwIDMwIDAyIDYwIDAwIDAwIDAwIDAwIDAwIDAw
ICAuLi4uIC4wMC5gLi4uLi4uClsgICA3Mi4xMjAwMDBdIGl0ZW0gZGF0YTogMDAwMDAwMTA6IDA0
IGYwIDIxIDBjIGE1IDQ0IDAwIDAwICAgICAgICAgICAgICAgICAgICAgICAgICAuLiEuLkQuLgpb
ICAgNzIuMTMwMDAwXSBhdGgxMGs6IHdtaSBwZWVyIGNyZWF0ZSB2ZGV2X2lkIDAgcGVlcl9hZGRy
IDA0OmYwOjIxOjBjOmE1OjQ0ClsgICA3Mi4xMzAwMDBdIGF0aDEwazogcGNpIHR4IGl0ZW0gMCBw
YWRkciAweDA3MjU5MjMwIGxlbiAyNCBuX2l0ZW1zIDEKWyAgIDcyLjEzMDAwMF0gaXRlbSBkYXRh
OiAwMDAwMDAwMDogMDIgMDEgMTAgMDAgMjAgYTUgMzAgMzAgMDEgNjAgMDAgMDAgMDAgMDAgMDAg
MDAgIC4uLi4gLjAwLmAuLi4uLi4KWyAgIDcyLjEzMDAwMF0gaXRlbSBkYXRhOiAwMDAwMDAxMDog
MDQgZjAgMjEgMGMgYTUgNDQgMDAgMDAgICAgICAgICAgICAgICAgICAgICAgICAgIC4uIS4uRC4u
ClsgICA3Mi4xMzAwMDBdIGF0aDEwazogd21pIHBlZXIgYXNzb2MgdmRldiAwIGFkZHIgMDQ6ZjA6
MjE6MGM6YTU6NDQKWyAgIDcyLjEzMDAwMF0gYXRoMTBrOiBwY2kgdHggaXRlbSAwIHBhZGRyIDB4
MDczOWM4MzAgbGVuIDM2OCBuX2l0ZW1zIDEKWyAgIDcyLjEzMDAwMF0gaXRlbSBkYXRhOiAwMDAw
MDAwMDogMDIgMDAgNjggMDEgMDAgYTYgMDAgMDAgMDUgNjAgMDAgMDAgMDQgZjAgMjEgMGMgIC4u
aC4uLi4uLmAuLi4uIS4KWyAgIDcyLjEzMDAwMF0gaXRlbSBkYXRhOiAwMDAwMDAxMDogYTUgNDQg
MDAgMDAgMDAgMDAgMDAgMDAgMDEgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIC5ELi4uLi4uLi4uLi4u
Li4KWyAgIDcyLjEzMDAwMF0gaXRlbSBkYXRhOiAwMDAwMDAyMDogMDEgOTAgMDEgMDAgMDAgMDAg
MDAgMDAgMDUgMDAgMDAgMDAgZTMgMTkgMDAgMDAgIC4uLi4uLi4uLi4uLi4uLi4KWyAgIDcyLjEz
MDAwMF0gaXRlbSBkYXRhOiAwMDAwMDAzMDogZmYgZmYgMDAgMDAgMDggMDAgMDAgMDAgNmMgMDIg
MDAgMDAgMDggMDAgMDAgMDAgIC4uLi4uLi4ubC4uLi4uLi4KWyAgIDcyLjEzMDAwMF0gaXRlbSBk
YXRhOiAwMDAwMDA0MDogMGMgMTIgMTggMjQgMzAgNDggNjAgNmMgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgIC4uLiQwSGBsLi4uLi4uLi4KWyAgIDcyLjEzMDAwMF0gaXRlbSBkYXRhOiAwMDAwMDA1
MDogMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIC4uLi4u
Li4uLi4uLi4uLi4KWyAgIDcyLjEzMDAwMF0gaXRlbSBkYXRhOiAwMDAwMDA2MDogMDAgMDAgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIC4uLi4uLi4uLi4uLi4uLi4K
WyAgIDcyLjEzMDAwMF0gaXRlbSBkYXRhOiAwMDAwMDA3MDogMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIC4uLi4uLi4uLi4uLi4uLi4KWyAgIDcyLjEzMDAw
MF0gaXRlbSBkYXRhOiAwMDAwMDA4MDogMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgMDAgIC4uLi4uLi4uLi4uLi4uLi4KWyAgIDcyLjEzMDAwMF0gaXRlbSBkYXRh
OiAwMDAwMDA5MDogMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgIC4uLi4uLi4uLi4uLi4uLi4KWyAgIDcyLjEzMDAwMF0gaXRlbSBkYXRhOiAwMDAwMDBhMDog
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIC4uLi4uLi4u
Li4uLi4uLi4KWyAgIDcyLjEzMDAwMF0gaXRlbSBkYXRhOiAwMDAwMDBiMDogMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIC4uLi4uLi4uLi4uLi4uLi4KWyAg
IDcyLjEzMDAwMF0gaXRlbSBkYXRhOiAwMDAwMDBjMDogMDAgMDAgMDAgMDAgMTggMDAgMDAgMDAg
MDAgMDEgMDIgMDMgMDQgMDUgMDYgMDcgIC4uLi4uLi4uLi4uLi4uLi4KWyAgIDcyLjEzMDAwMF0g
aXRlbSBkYXRhOiAwMDAwMDBkMDogMDggMDkgMGEgMGIgMGMgMGQgMGUgMGYgMTAgMTEgMTIgMTMg
MTQgMTUgMTYgMTcgIC4uLi4uLi4uLi4uLi4uLi4KWyAgIDcyLjEzMDAwMF0gaXRlbSBkYXRhOiAw
MDAwMDBlMDogMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
IC4uLi4uLi4uLi4uLi4uLi4KWyAgIDcyLjEzMDAwMF0gaXRlbSBkYXRhOiAwMDAwMDBmMDogMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIC4uLi4uLi4uLi4u
Li4uLi4KWyAgIDcyLjEzMDAwMF0gaXRlbSBkYXRhOiAwMDAwMDEwMDogMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIC4uLi4uLi4uLi4uLi4uLi4KWyAgIDcy
LjEzMDAwMF0gaXRlbSBkYXRhOiAwMDAwMDExMDogMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgIC4uLi4uLi4uLi4uLi4uLi4KWyAgIDcyLjEzMDAwMF0gaXRl
bSBkYXRhOiAwMDAwMDEyMDogMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgIC4uLi4uLi4uLi4uLi4uLi4KWyAgIDcyLjEzMDAwMF0gaXRlbSBkYXRhOiAwMDAw
MDEzMDogMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIC4u
Li4uLi4uLi4uLi4uLi4KWyAgIDcyLjEzMDAwMF0gaXRlbSBkYXRhOiAwMDAwMDE0MDogMDAgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDEgMDAgMDAgMDAgIC4uLi4uLi4uLi4uLi4u
Li4KWyAgIDcyLjEzMDAwMF0gaXRlbSBkYXRhOiAwMDAwMDE1MDogMDAgMDAgMDAgMDAgMDQgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIC4uLi4uLi4uLi4uLi4uLi4KWyAgIDcyLjEz
MDAwMF0gaXRlbSBkYXRhOiAwMDAwMDE2MDogMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgIC4uLi4uLi4uLi4uLi4uLi4KWyAgIDcyLjEzMDAwMF0gYXRoMTBr
OiB3bWkgdmRldiAwIHBlZXIgMHgwNDpmMDoyMTowYzphNTo0NCBzZXQgcGFyYW0gMSB2YWx1ZSAx
ClsgICA3Mi4xMzAwMDBdIGF0aDEwazogcGNpIHR4IGl0ZW0gMCBwYWRkciAweDA3MjU5MDMwIGxl
biAzMiBuX2l0ZW1zIDEKWyAgIDcyLjEzMDAwMF0gaXRlbSBkYXRhOiAwMDAwMDAwMDogMDIgMDEg
MTggMDAgMDAgYTcgMDAgMDAgMDQgNjAgMDAgMDAgMDAgMDAgMDAgMDAgIC4uLi4uLi4uLmAuLi4u
Li4KWyAgIDcyLjEzMDAwMF0gaXRlbSBkYXRhOiAwMDAwMDAxMDogMDQgZjAgMjEgMGMgYTUgNDQg
MDAgMDAgMDEgMDAgMDAgMDAgMDEgMDAgMDAgMDAgIC4uIS4uRC4uLi4uLi4uLi4KWyAgIDcyLjQ3
MDAwMF0gYXRoMTBrOiB3bWkgZXZlbnQgZGVidWcgbWVzZyBsZW4gODQKCg==
--047d7b676bf895324604f3c57979
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--047d7b676bf895324604f3c57979--
