Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7o6Q-000303-5F
 for ath10k@lists.infradead.org; Thu, 17 Jul 2014 16:00:14 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k OTP loading issues
References: <53AD2EEE.4040704@marcant.net>
 <87tx70p4e0.fsf@kamboji.qca.qualcomm.com>
 <CAGXE3d-i1Cf93cTuM=gSPttOBsCrP1c_Hb0=XDi8mXsZBm-MUQ@mail.gmail.com>
 <53C59A22.6000505@marcant.net>
 <CAGXE3d8KZ=BG6a2PBhY_ZAhf71admtrnCF01LNoyA2tnLNJcAA@mail.gmail.com>
 <87wqbc6n8n.fsf@kamboji.qca.qualcomm.com>
 <CAGXE3d_FQvvmkGajQ1ioU5mEL04xVzUQ1k9-uXSLjoDFX+Z-Cg@mail.gmail.com>
 <87lhrs6l2r.fsf@kamboji.qca.qualcomm.com>
 <53C7F1CE.3060501@marcant.net>
Date: Thu, 17 Jul 2014 18:59:47 +0300
In-Reply-To: <53C7F1CE.3060501@marcant.net> (Andre Valentin's message of "Thu, 
 17 Jul 2014 17:54:54 +0200")
Message-ID: <87fvi06kng.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Andre Valentin <avalentin@marcant.net>
Cc: Helmut Schaa <helmut.schaa@googlemail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Andre Valentin <avalentin@marcant.net> writes:

> Hi!
>
> On 17.07.2014 17:50, Kalle Valo wrote:
>> Helmut Schaa <helmut.schaa@googlemail.com> writes:
>>
>>>> But in method 2) otp.bin will fail as there's no data in the OTP area.
>>>> This is expected and that's why we should not run otp.bin at all with
>>>> method 2).
>>>
>>> Thanks for clarification Kalle! So, method 2 requires only a
>>> board.bin?
>>
>> Yes. You need to extract the board file from the MTD partition and
>> provide it to ath10k.
>
> So the question is why does in this case fail the otp.bin loading
> process or why is it started. How can I prevent it. I provided the
> correspondig board.bin. If needed, I could run a debug on the ath10k
> loading.

Because ath10k does not support method 2) yet. We only support method 1)
right now, ie. the calibration data stored in OTP area.

Patches more than welcome to fix the situation :)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
