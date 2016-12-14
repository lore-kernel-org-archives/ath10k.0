Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cH9wG-0003cZ-05
 for ath10k@lists.infradead.org; Wed, 14 Dec 2016 13:49:44 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [RFC v2 05/11] ath10k: htc: refactorization
Date: Wed, 14 Dec 2016 13:49:10 +0000
Message-ID: <87wpf2wrhm.fsf@kamboji.qca.qualcomm.com>
References: <1479496971-19174-1-git-send-email-erik.stromdahl@gmail.com>
 <1479496971-19174-6-git-send-email-erik.stromdahl@gmail.com>
 <87inqoymd0.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQkuUFxnra75B4LpF5+k9yE7hkNYDXbtUMBLq2LFuPSasg@mail.gmail.com>
 <871sxbzqo6.fsf@kamboji.qca.qualcomm.com>
 <70b8a055-e6ba-857d-8b03-06f50e3f10fe@gmail.com>
 <CA+BoTQmRV59imnmSykjs=ym0qut9akUHzFKfAMioK=MT8my98A@mail.gmail.com>
In-Reply-To: <CA+BoTQmRV59imnmSykjs=ym0qut9akUHzFKfAMioK=MT8my98A@mail.gmail.com>	(Michal
 Kazior's message of "Tue, 13 Dec 2016 20:21:53 +0100")
Content-Language: en-US
Content-ID: <720A8D67622C764FB8EA50ADB64DEAAF@qualcomm.com>
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
To: "michal.kazior@tieto.com" <michal.kazior@tieto.com>
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

>> I have made a few updates since I submitted the original RFC and created
>> a repo on github:
>>
>> https://github.com/erstrom/linux-ath
>>
>> I have a bunch of branches that are all based on the tags on the ath master.
>>
>> As of this moment the latest version is:
>>
>> ath-201612131156-ath10k-sdio
>>
>> This branch contains the original RFC patches plus some addons/fixes.
>>
>> In the above mentioned branch there are a few commits related to this
>> race condition. Perhaps you can have a look at them?
>>
>> The commits are:
>> 821672913328cf737c9616786dc28d2e4e8a4a90
>
> I would avoid if(bus==xx) checks.

Very much agreed. For example to enable HTT high latency support you
could add an enum to ath10k_core_create() with values for both high and
low latency. This way sdio.c and pci.c can enable the correct mode
during initialisation.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
