Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8u2g-0004jw-Ad
 for ath10k@lists.infradead.org; Wed, 07 Jan 2015 17:05:12 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: fixup wait_for_completion_timeout return
 handling
References: <1419968660-17404-1-git-send-email-der.herr@hofr.at>
Date: Wed, 7 Jan 2015 19:04:36 +0200
In-Reply-To: <1419968660-17404-1-git-send-email-der.herr@hofr.at> (Nicholas Mc
 Guire's message of "Tue, 30 Dec 2014 14:44:20 -0500")
Message-ID: <87sifmsesb.fsf@kamboji.qca.qualcomm.com>
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
To: Nicholas Mc Guire <der.herr@hofr.at>
Cc: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Michal Kazior <michal.kazior@tieto.com>, Ben Greear <greearb@candelatech.com>, Yanbo Li <yanbol@qca.qualcomm.com>

Nicholas Mc Guire <der.herr@hofr.at> writes:

> wait_for_completion_timeout does not return negative values so the tests
> for <= 0 are not needed and the case differentiation in the error handling
> path unnecessary.
>
> v2: all wait_for_completion_timeout changes in a single patch
>
> patch was only compile tested x86_64_defconfig + CONFIG_ATH_CARDS=m
> CONFIG_ATH10K=m
>
> patch is against linux-next 3.19.0-rc1 -next-20141226
>
> None of the proposed cleanups are critical.
> All changes should only be removing unreachable cases.
>
> Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>
> ---

All the comments after "v2:" should be here, under the "---" line so
that git-am can automatically discard them.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
