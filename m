Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imDy8-00025o-BK
 for ath10k@lists.infradead.org; Tue, 31 Dec 2019 09:37:42 +0000
MIME-Version: 1.0
Date: Tue, 31 Dec 2019 17:37:37 +0800
From: wgong@codeaurora.org
Subject: Re: [PATCH v2 1/2] ath10k: add refcount for ath10k_core_restart
In-Reply-To: <CAMrEMU-p3+HRZYW6TzXwZSwhxj9oJ9JW1Rg=ZysJ3fr0rm45Ng@mail.gmail.com>
References: <20191225120002.11163-1-wgong@codeaurora.org>
 <20191225120002.11163-2-wgong@codeaurora.org>
 <CAMrEMU-p3+HRZYW6TzXwZSwhxj9oJ9JW1Rg=ZysJ3fr0rm45Ng@mail.gmail.com>
Message-ID: <5f6eb95de0f877b86b90d0c32d458d43@codeaurora.org>
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
To: Justin Capella <justincapella@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>

On 2019-12-25 23:14, Justin Capella wrote:
> This does not only effect SDIO.
> 
> Why a semaphore / count? Could the conf_mutex be held earlier, or
> perhaps change the state to ATH10K_STATE_RESTARTING first?
> ath10k_reconfig_complete is also called in mac.c when channel is 
> changed so
patch v2:
https://patchwork.kernel.org/patch/11313853/
https://patchwork.kernel.org/patch/11313859/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
