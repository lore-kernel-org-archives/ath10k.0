Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f14V4-0003ej-Ko
 for ath10k@lists.infradead.org; Wed, 28 Mar 2018 06:24:00 +0000
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add GL.iNet GL-B1300 specific BDFs
References: <CAEYLdSij6gAAmG2+MQmfGD-m4tOi3O-h0HNmQutwrdQb_iG3Gg@mail.gmail.com>
 <2037513.gUX94vxXhd@bentobox>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <b0320000-ac88-0992-c4c8-e41a137a3249@dd-wrt.com>
Date: Wed, 28 Mar 2018 08:23:43 +0200
MIME-Version: 1.0
In-Reply-To: <2037513.gUX94vxXhd@bentobox>
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
To: ath10k@lists.infradead.org

correct me if i'm wrong. but isnt the board data stored in flash memory =

on these devices like on every other router i know using ath10k chipsets?
this all sounds a little bit curious for me

Sebastian

Am 27.03.2018 um 09:19 schrieb Sven Eckelmann:
> On Dienstag, 27. M=E4rz 2018 14:48:05 CEST Dongming Han wrote:
>> I think the ART data is made based on BDF. Maybe the antCtrlCommon logic
>> and target power parameter is passed to driver by ART but not BDF?
>> That way we're all happier no need to mantain these change. Please advis=
e.
> The antCtrlCommon is part of biModalHeader and this one is taken from the=
 BDF
> and not from the pre-cal data (ART). Same is true for the target power li=
mits.
>
> I am only aware of following things which are taken from the pre-cal data
> (ART):
>
> * mac
> * hal_cal version info
> * custData
> * regDmn
> * txrxMask
> * calFreqPier*
> * calPierData*
> * rxGainCalTbl
> * param_for_tuning_caps*
>
> Of course, also the bmi ids are taken from the ART before you load the co=
rrect
> BDF from the board-2.bin (otherwise, the chip would not know what it actu=
ally
> is).
>
> Kind regards,
> 	Sven
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k


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
