Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMsqn-0007py-FX
 for ath10k@lists.infradead.org; Fri, 20 Sep 2013 05:01:54 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix tracing of ath10k_wmi_cmd
References: <1379576649-3947-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 20 Sep 2013 08:01:23 +0300
In-Reply-To: <1379576649-3947-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 19 Sep 2013 09:44:09 +0200")
Message-ID: <874n9ghysc.fsf@qca.qualcomm.com>
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

> One of my recent patches broke tracing. kbuild
> test robot reported this issue.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Bad luck as I had accidentally tracing disabled on my test build. Patch
applied, but changed the commit log to:

commit 9e84f653ac16b718dd2305abe64a29bb3428621e
Author: Michal Kazior <michal.kazior@tieto.com>
Date:   Thu Sep 19 09:44:09 2013 +0200

    ath10k: fix tracing build for ath10k_wmi_cmd
    
    Commit be8b394390 ("ath10k: make WMI commands block by design") broke
    the build if CONFIG_ATH10K_TRACING was enabled.
    
    Reported-by: kbuild test robot <fengguang.wu@intel.com>
    Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
    Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
