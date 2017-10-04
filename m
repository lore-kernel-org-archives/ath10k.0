Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dzmeM-0008Cl-0y
 for ath10k@lists.infradead.org; Wed, 04 Oct 2017 16:36:00 +0000
Subject: Re: QCA988x and kernel 4.13
References: <c6294832-ff1e-595c-da8b-dac59b12a976@gmail.com>
 <7549b77b-3619-f8a5-48d6-eb7e330ba80e@dd-wrt.com>
 <48aebea8-9231-b41e-cbaa-d592d8540c53@candelatech.com>
 <87d163xpoe.fsf@kamboji.qca.qualcomm.com>
 <78f5383d-0187-628e-cf56-de6234fdb9b0@candelatech.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <62fdf553-8c2e-538e-3743-511e9bfa7721@dd-wrt.com>
Date: Wed, 4 Oct 2017 18:35:29 +0200
MIME-Version: 1.0
In-Reply-To: <78f5383d-0187-628e-cf56-de6234fdb9b0@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, svp <s.pooheer@gmail.com>

Am 04.10.2017 um 17:13 schrieb Ben Greear:
>
>
> On 10/04/2017 01:50 AM, Kalle Valo wrote:
>> Ben Greear <greearb@candelatech.com> writes:
>>
>>> On 10/01/2017 07:06 AM, Sebastian Gottschall wrote:
>>>> you have to update to the latest mac80211 code. there is a well
>>>> known bug in mac80211 which causes a deadlock with ath10k
>>>
>>> Do you have a pointer to the patch that fixes this?=A0 I'd like to =

>>> check if it has
>>> made it into 4.13 stable yet...
>>
>> I think it's this one:
>>
>> mac80211: fix deadlock in driver-managed RX BA session start
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/?id=3Dbde59c475e0883e4c4294bcd9b9c7e08ae18c828 =

>>
>>
>> Adding linux-wireless so that someone can correct me in case I'm wrong.
>
> That did seem to fix my problems...
>
> Thanks,
> ben
>
consider that this bug does at least exist since may. so older kernels =

might be affected too


-- =

Mit freundlichen Gr=FCssen / Regards

Sebastian Gottschall / CTO

NewMedia-NET GmbH - DD-WRT
Firmensitz:  Stubenwaldallee 21a, 64625 Bensheim
Registergericht: Amtsgericht Darmstadt, HRB 25473
Gesch=E4ftsf=FChrer: Peter Steinh=E4user, Christian Scheele
http://www.dd-wrt.com
email: s.gottschall@dd-wrt.com
Tel.: +496251-582650 / Fax: +496251-5826565


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
