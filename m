Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1vqV-00058x-JS
 for ath10k@lists.infradead.org; Thu, 26 Nov 2015 12:40:20 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: next-20151126 build: 3 failures 15 warnings (next-20151126)
References: <E1a1sVV-00079q-My@optimist> <20151126121551.GE1929@sirena.org.uk>
Date: Thu, 26 Nov 2015 14:39:40 +0200
In-Reply-To: <20151126121551.GE1929@sirena.org.uk> (Mark Brown's message of
 "Thu, 26 Nov 2015 12:15:51 +0000")
Message-ID: <87y4dllysz.fsf@kamboji.qca.qualcomm.com>
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
To: Mark Brown <broonie@kernel.org>
Cc: linaro-kernel@lists.linaro.org, kernel-build-reports@lists.linaro.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, linux-next@vger.kernel.org

Mark Brown <broonie@kernel.org> writes:

> On Thu, Nov 26, 2015 at 09:06:25AM +0000, Build bot for Mark Brown wrote:
>
> Today's -next fails to build an arm64 allmodconfig due to:
>
>> 	arm64-allmodconfig
>> ../drivers/net/wireless/ath/ath10k/thermal.c:119:6: error: redefinition of 'ath10k_thermal_event_temperature'
>> ../drivers/net/wireless/ath/ath10k/thermal.c:136:6: error: redefinition of 'ath10k_thermal_set_throttling'
>> ../drivers/net/wireless/ath/ath10k/thermal.c:162:5: error: redefinition of 'ath10k_thermal_register'
>> ../drivers/net/wireless/ath/ath10k/thermal.c:216:6: error: redefinition of 'ath10k_thermal_unregister'
>
> This is happening because there are stub functions provided in the
> driver's thermal.h for !THERMAL cases but these are guarded by an #ifdef
> not an #if and so fails to do the right thing if the thermal code is
> built as a module.

Thanks, I'll apply the fix soon. Just wait for comments from others
first.

> It looks like this was somehow triggered as part of the reorganisation
> of the WiFi directory structure.

This is surprising and also worrying, any ideas why? It would be good to
understand the root cause in case there's a bug in wireless drivers
directory reorganisation.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
