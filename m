Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9cC6-0001mv-Fx
 for ath10k@lists.infradead.org; Fri, 09 Jan 2015 16:13:51 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: fix build error when hwmon is off
References: <20150107150410.17433.49263.stgit@potku.adurom.net>
Date: Fri, 9 Jan 2015 18:13:18 +0200
In-Reply-To: <20150107150410.17433.49263.stgit@potku.adurom.net> (Kalle Valo's
 message of "Wed, 7 Jan 2015 17:04:10 +0200")
Message-ID: <87ppaohqzl.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> kbuild reported a linking error:
>
> ERROR: "devm_hwmon_device_register_with_groups"
> [drivers/net/wireless/ath/ath10k/ath10k_core.ko] undefined!
>
> Fix it by returning early and letting the compiler to optimise out the function
> call.
>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Applied to ath.git.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
