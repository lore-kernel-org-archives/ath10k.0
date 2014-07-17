Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qg0-x232.google.com ([2607:f8b0:400d:c04::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7tTo-0006OZ-4D
 for ath10k@lists.infradead.org; Thu, 17 Jul 2014 21:44:44 +0000
Received: by mail-qg0-f50.google.com with SMTP id q108so2514837qgd.37
 for <ath10k@lists.infradead.org>; Thu, 17 Jul 2014 14:44:20 -0700 (PDT)
In-Reply-To: <87lhrs6l2r.fsf@kamboji.qca.qualcomm.com>
References: <53AD2EEE.4040704@marcant.net>
 <87tx70p4e0.fsf@kamboji.qca.qualcomm.com>
 <CAGXE3d-i1Cf93cTuM=gSPttOBsCrP1c_Hb0=XDi8mXsZBm-MUQ@mail.gmail.com>
 <53C59A22.6000505@marcant.net>
 <CAGXE3d8KZ=BG6a2PBhY_ZAhf71admtrnCF01LNoyA2tnLNJcAA@mail.gmail.com>
 <87wqbc6n8n.fsf@kamboji.qca.qualcomm.com>
 <CAGXE3d_FQvvmkGajQ1ioU5mEL04xVzUQ1k9-uXSLjoDFX+Z-Cg@mail.gmail.com>
 <87lhrs6l2r.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Subject: Re: ath10k OTP loading issues
From: Helmut Schaa <helmut.schaa@googlemail.com>
Date: Thu, 17 Jul 2014 23:44:08 +0200
Message-ID: <63dce1c7-0142-4592-b8a1-2b09dce63af3@email.android.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Andre Valentin <avalentin@marcant.net>, ath10k@lists.infradead.org



On 17. Juli 2014 17:50:36 MESZ, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>Helmut Schaa <helmut.schaa@googlemail.com> writes:
>
>>> But in method 2) otp.bin will fail as there's no data in the OTP
>area.
>>> This is expected and that's why we should not run otp.bin at all
>with
>>> method 2).
>>
>> Thanks for clarification Kalle! So, method 2 requires only a
>> board.bin?
>
>Yes. You need to extract the board file from the MTD partition and
>provide it to ath10k.

Understood. Will give it a try soon ...
Helmut

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
