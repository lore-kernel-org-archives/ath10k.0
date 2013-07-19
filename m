Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V07mG-0003U0-OH
 for ath10k@lists.infradead.org; Fri, 19 Jul 2013 10:19:09 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v4 00/10] ath10k: device setup refactor
References: <1371041642-20273-1-git-send-email-michal.kazior@tieto.com>
 <1373960339-8525-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 19 Jul 2013 13:18:39 +0300
In-Reply-To: <1373960339-8525-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 16 Jul 2013 09:38:49 +0200")
Message-ID: <874nbq6ef4.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> This is a respin of my patchset that addresses
> hibernation issues.
>
> This is also groundwork for proper hw recovery
> that I'm going to post too.
>
> v4:
>  * update comments in pci logic decoupling
>  * add missing commit message for one of the patches
>  * update commit message for free_vdev_map patch
>
> Michal Kazior (10):
>   ath10k: decouple pci start/stop logic
>   ath10k: decouple core start/stop logic
>   ath10k: allow deferred regd update
>   ath10k: reset BMI state upon init
>   ath10k: decouple suspend code
>   ath10k: move free_vdev_map initialization
>   ath10k: make sure all resources are freed upon ath10k_stop()
>   ath10k: defer hw setup to start/stop mac80211 hooks
>   ath10k: store firmware files in memory
>   ath10k: skip fw stats debugfs interface if device is down

Thanks, all 10 applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
