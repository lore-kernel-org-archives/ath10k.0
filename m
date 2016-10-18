Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwPeB-0006Sy-Dx
 for ath10k@lists.infradead.org; Tue, 18 Oct 2016 08:21:21 +0000
References: <CA+uUJGtXNAe=FRgYTVDNf6aNVE78CMSs+gLj-bQgA_=hFZibaA@mail.gmail.com>
 <57320C1A.3040604@candelatech.com>
 <CA+uUJGukss2Z7i=k0OvERWvkzMGwBFTaY6R_TL5sGo4yXKQFsA@mail.gmail.com>
 <57335A43.4050902@candelatech.com>
 <CA+uUJGsVi0OiwK4D6n-ANXRm6ptiTdjvKNboXobwn4FA0YfsRQ@mail.gmail.com>
 <573892F5.40706@candelatech.com> <5738AE96.8040800@candelatech.com>
 <CA+uUJGuMrDoXat3rD2AeHTLZUCUDPHXhHVy==62mGLN01O8Vdw@mail.gmail.com>
 <87mvnp6ser.fsf@kamboji.qca.qualcomm.com>
 <572a14ee-d1b5-7b85-d292-51f583f34f17@dd-wrt.com>
 <87lgyug42q.fsf@kamboji.qca.qualcomm.com>
 <bd2ae01e-6cf5-837e-5573-1d62bbfdbe1b@dd-wrt.com>
 <8737l2ee1y.fsf@kamboji.qca.qualcomm.com>
 <5c915231-db74-a147-f904-21c09d8a1ff0@dd-wrt.com>
 <87vawv9qzv.fsf@kamboji.qca.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <1be11c35-2a7d-4f08-4e1c-23548d6f8efc@dd-wrt.com>
Date: Tue, 18 Oct 2016 10:20:50 +0200
MIME-Version: 1.0
In-Reply-To: <87vawv9qzv.fsf@kamboji.qca.qualcomm.com>
Subject: Re: [PATCH] QCA9984 VHT160 support
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Am 14.10.2016 um 12:14 schrieb Valo, Kalle:
> Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:
>
>> This patch adds full VHT160 support for QCA9984 chipsets
>> Tested on Netgear R7800. 80+80 is possible, but disabled so far since
>> it seems to contain glitches like missing vht station flags (this may
>> be firmware or mac80211 related)
> So how did you disable 80+80 exactly? I can't find it and I would like
> to add a comment to the code so that it's easy to enable it later (once
> it's working).


IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ  =3Dvht160 only
IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ =3D vht160 and 80+80 =

support

+    if ((ar->vht_cap_info & IEEE80211_VHT_CAP_SHORT_GI_160) &&
+        !(ar->vht_cap_info & =

IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ))
+        vht_cap.cap |=3D IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ;
+

so if the firmware itself doesnt contain the correct vht flags but just =

short_gi_160 flag. i assume it supports vht160 and set the vht160 only =

flag.
newer firmwares on codeaurora contain the correct flags. so this code =

here gets avoided. unfortunatly the newer i found is also not stable and =

crashes often.
you can also enable 80+80 support with the current firmware.but all =

station ht and vht flags seem to be empty then in vht160 mode too. so it =

might be a firmware issue still with 80+80 or mac80211.
i did not debug that much. but vht160 works. i also tested it now with a =

88w6964 marvell client in vht160 which worked too


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
