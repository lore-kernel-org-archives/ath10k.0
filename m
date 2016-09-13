Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by casper.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjm8W-0008Ha-SW
 for ath10k@lists.infradead.org; Tue, 13 Sep 2016 11:44:28 +0000
References: <2661831.slnB0LOeVt@prime>
 <87h99kjca5.fsf@kamboji.qca.qualcomm.com> <15353347.MUgkgiNHdu@prime>
 <87d1k8jb34.fsf@kamboji.qca.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <676d6d4a-7846-2362-8b4b-833b6d2ece7f@dd-wrt.com>
Date: Tue, 13 Sep 2016 13:38:26 +0200
MIME-Version: 1.0
In-Reply-To: <87d1k8jb34.fsf@kamboji.qca.qualcomm.com>
Subject: Re: ath10k mesh + ap + encryption?
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>, Simon Wunderlich <sw@simonwunderlich.de>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, "openwrt-devel@lists.openwrt.org" <openwrt-devel@lists.openwrt.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Am 13.09.2016 um 13:25 schrieb Valo, Kalle:
> Simon Wunderlich <sw@simonwunderlich.de> writes:
>
>> On Tuesday, September 13, 2016 10:59:31 AM CEST Valo, Kalle wrote:
>>> Simon Wunderlich <sw@simonwunderlich.de> writes:
>>>> we have done some experiments last week on ath10k, trying to run mesh
>>>> (802.11s) and access point at the same time, both encrypted.
>>>>
>>>> We have tested a recent LEDE (reboot-1519-g42f559e) but with
>>>> firmware-5.bin_10.2.4.70.42-2 and the included wpa_supplicant, which g=
ave
>>>> us a working encrypted 802.11s network. However, starting an AP at the
>>>> same time didn't work (AP doesn't beacon). This wasn't a problem when
>>>> 802.11s was running unencrypted.
>>>>
>>>> We also tested version 10.2.4.97 (from codeaurora), which is now defau=
lt
>>>> in
>>>> LEDE. However, this version apparently doesn't support 11s mesh at all
>>>> (WMI_SERVICE_MESH_11S is disabled in the service map, but cfg/mac80211
>>>> advertises support).
>>>>
>>>> So here are my questions:
>>>>   * Did anyone succesfully run AP and mesh, both encrypted at the same
>>>>   time?
>>>>   * Do you have any pointers how we could fix this? Could it be fixabl=
e in
>>>>   the>
>>>> driver (i.e. not in firmware)?
>>>>
>>>>   * Does anyone have an idea if 11s will be supported in future versio=
ns? I
>>>>
>>>> didn't find any changelogs, but having 11s mode no longer in the servi=
ce
>>>> map does not make me optimistic.
>>> Why is LEDE using 10.2.4.97? It seems to be a quite old release and I
>>> have no knowledge if anyone even tests that firmware branch with ath10k.
>>> I recommend to only use firmware releases from ath10k-firmware.git as we
>>> use those internally with ath10k. In any case, don't make any
>>> assumptions about future from that firmware branch as it's so old.
>> This was introduced in December 25th, 2015 after some firmware-related
>> problems. I'm CC'ing Martin Blumenstingl who suggested this change.
>>
>> Since then, ath10k is pulling firmware from here (unless ct firmware is =
used):
>>
>> https://source.codeaurora.org/quic/qsdk/oss/firmware/ath10k-firmware/pla=
in/
>> 10.2.4/firmware-5.bin_10.2.4.97-1
>>
>> However, I don't understand the numbering? 10.2.4.97 > 10.2.4.70, but yo=
u say
>> 10.2.4.70.42-2 is more recent? I would have assumed otherwise from the
>> numbers. However, 10.2.4.70 has much more sub-revisions.
> As I said before, I just deliver the firmware files to the community and
> the firmware team creates the actual releases. But my understanding is
> that these are from different branches which are built independently
> (and might have different features, like in this case the mesh support)
> so I would not make any conclusions if any firmware is "better" just
> from the numbers alone.
would be good to have changelogs so see what has been changed to test =

what they have changed in the fw
>


-- =

Mit freundlichen Gr=FCssen / Regards

Sebastian Gottschall / CTO

NewMedia-NET GmbH - DD-WRT
Firmensitz:  Berliner Ring 101, 64625 Bensheim
Registergericht: Amtsgericht Darmstadt, HRB 25473
Gesch=E4ftsf=FChrer: Peter Steinh=E4user, Christian Scheele
http://www.dd-wrt.com
email: s.gottschall@dd-wrt.com
Tel.: +496251-582650 / Fax: +496251-5826565


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
