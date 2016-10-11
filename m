Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1btluX-0006vY-TS
 for ath10k@lists.infradead.org; Tue, 11 Oct 2016 01:31:22 +0000
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
 <87wphgi41c.fsf@kamboji.qca.qualcomm.com>
 <87shs4i3yi.fsf@kamboji.qca.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <938e11ff-5989-2412-b647-25ea3977ae35@dd-wrt.com>
Date: Tue, 11 Oct 2016 03:30:50 +0200
MIME-Version: 1.0
In-Reply-To: <87shs4i3yi.fsf@kamboji.qca.qualcomm.com>
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

Am 10.10.2016 um 18:06 schrieb Valo, Kalle:
> Kalle Valo <kvalo@qca.qualcomm.com> writes:
>
>> Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:
>>
>>> This patch adds full VHT160 support for QCA9984 chipsets
>>> Tested on Netgear R7800. 80+80 is possible, but disabled so far since
>>> it seems to contain glitches like missing vht station flags (this may
>>> be firmware or mac80211 related)
>> There are some compilation and checkpatch warnings. Also you forgot to
>> CC linux-wireless and sent the patch as an attachment. I'll send v2 to
>> fix those.
gen_dbglog_cfg? i did not touch anything on this struct in my patch. =

this warning doesnt seem to belong to my patch
> Forgot the actual warnings:
>
> drivers/net/wireless/ath/ath10k/wmi-tlv.c:3520:2: warning: initialization=
 from incompatible pointer type [enabled by default]
> drivers/net/wireless/ath/ath10k/wmi-tlv.c:3520:2: warning: (near initiali=
zation for 'wmi_tlv_ops.gen_dbglog_cfg') [enabled by default]
> drivers/net/wireless/ath/ath10k/wmi-tlv.c:3520:27: warning: incorrect typ=
e in initializer (incompatible argument 2 (different type sizes))
> drivers/net/wireless/ath/ath10k/wmi-tlv.c:3520:27:    expected struct sk_=
buff *( *gen_dbglog_cfg )( ... )
> drivers/net/wireless/ath/ath10k/wmi-tlv.c:3520:27:    got struct sk_buff =
*( static [toplevel] *<noident> )( ... )
> drivers/net/wireless/ath/ath10k/wmi-tlv.h:546: code indent should use tab=
s where possible
> drivers/net/wireless/ath/ath10k/wmi-tlv.h:546: please, no spaces at the s=
tart of a line
> drivers/net/wireless/ath/ath10k/mac.c:2556: braces {} should be used on a=
ll arms of this statement
> drivers/net/wireless/ath/ath10k/mac.c:2560: line over 90 characters
> drivers/net/wireless/ath/ath10k/mac.c:4301: line over 90 characters
> drivers/net/wireless/ath/ath10k/mac.c:4301: braces {} are not necessary f=
or single statement blocks
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
