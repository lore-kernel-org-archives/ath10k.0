Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y60Rx-0007T1-SH
 for ath10k@lists.infradead.org; Tue, 30 Dec 2014 17:19:18 +0000
Received: by mail-lb0-f170.google.com with SMTP id 10so12597492lbg.29
 for <ath10k@lists.infradead.org>; Tue, 30 Dec 2014 09:18:55 -0800 (PST)
Message-ID: <54A2DE7C.1050602@cogentembedded.com>
Date: Tue, 30 Dec 2014 20:18:52 +0300
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] ath10k: a few incorrect return handling fix-up
References: <1419942046-17985-1-git-send-email-der.herr@hofr.at>
In-Reply-To: <1419942046-17985-1-git-send-email-der.herr@hofr.at>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Nicholas Mc Guire <der.herr@hofr.at>, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Michal Kazior <michal.kazior@tieto.com>, Yanbo Li <yanbol@qti.qualcomm.com>, Ben Greear <greearb@candelatech.com>

Hello.

On 12/30/2014 03:20 PM, Nicholas Mc Guire wrote:

> wait_for_completion_timeout does not return negative values so the tests
> for <= 0 are not needed and the case differentiation in the error handling
> path unnecessary.

    I decided to verify your statement and I saw that it seems wrong. 
do_wait_for_common() can return -ERESTARTSYS and the return value gets 
returned by its callers unchanged.

> patch was only compile tested x86_64_defconfig + CONFIG_ATH_CARDS=m
> CONFIG_ATH10K=m

> patch is against linux-next 3.19.0-rc1 -next-20141226

    Rather patches. It would have been better to send one patch instead of 4 
patches with the same name.

WBR, Sergei


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
