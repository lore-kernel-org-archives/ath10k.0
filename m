Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.marcant.net ([217.14.160.186])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7o1s-0000dr-Vh
 for ath10k@lists.infradead.org; Thu, 17 Jul 2014 15:55:33 +0000
Message-ID: <53C7F1CE.3060501@marcant.net>
Date: Thu, 17 Jul 2014 17:54:54 +0200
From: Andre Valentin <avalentin@marcant.net>
MIME-Version: 1.0
Subject: Re: ath10k OTP loading issues
References: <53AD2EEE.4040704@marcant.net>	<87tx70p4e0.fsf@kamboji.qca.qualcomm.com>	<CAGXE3d-i1Cf93cTuM=gSPttOBsCrP1c_Hb0=XDi8mXsZBm-MUQ@mail.gmail.com>	<53C59A22.6000505@marcant.net>	<CAGXE3d8KZ=BG6a2PBhY_ZAhf71admtrnCF01LNoyA2tnLNJcAA@mail.gmail.com>	<87wqbc6n8n.fsf@kamboji.qca.qualcomm.com>	<CAGXE3d_FQvvmkGajQ1ioU5mEL04xVzUQ1k9-uXSLjoDFX+Z-Cg@mail.gmail.com>
 <87lhrs6l2r.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87lhrs6l2r.fsf@kamboji.qca.qualcomm.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>, Helmut Schaa <helmut.schaa@googlemail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi!

On 17.07.2014 17:50, Kalle Valo wrote:
> Helmut Schaa <helmut.schaa@googlemail.com> writes:
>
>>> But in method 2) otp.bin will fail as there's no data in the OTP area.
>>> This is expected and that's why we should not run otp.bin at all with
>>> method 2).
>>
>> Thanks for clarification Kalle! So, method 2 requires only a
>> board.bin?
>
> Yes. You need to extract the board file from the MTD partition and
> provide it to ath10k.
>
So the question is why does in this case fail the otp.bin loading process o=
r why is it started.
How can I prevent it. I provided the correspondig board.bin. If needed, I c=
ould run
a debug on the ath10k loading.

Kind regards,

Andr=E9


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
