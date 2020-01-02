Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imqsT-0003gl-HL
 for ath10k@lists.infradead.org; Thu, 02 Jan 2020 03:10:26 +0000
Received: by mail-ot1-x342.google.com with SMTP id p8so18801477oth.10
 for <ath10k@lists.infradead.org>; Wed, 01 Jan 2020 19:10:25 -0800 (PST)
MIME-Version: 1.0
References: <20191225120002.11163-1-wgong@codeaurora.org>
 <20191225120002.11163-2-wgong@codeaurora.org>
 <CAMrEMU-p3+HRZYW6TzXwZSwhxj9oJ9JW1Rg=ZysJ3fr0rm45Ng@mail.gmail.com>
 <5f6eb95de0f877b86b90d0c32d458d43@codeaurora.org>
In-Reply-To: <5f6eb95de0f877b86b90d0c32d458d43@codeaurora.org>
From: Justin Capella <justincapella@gmail.com>
Date: Wed, 1 Jan 2020 19:10:13 -0800
Message-ID: <CAMrEMU_eLfD6=7esrYJA4GnU=CcWgBey1QZL+-=RVoRUUcfZKw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ath10k: add refcount for ath10k_core_restart
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>

Instead of the atomic restart count, can the state be updated to
ATH10K_STATE_RESTARTING while holding
     mutex_unlock(&ar->conf_mutex);

I don't understand the bundles, but I wonder about the case when there
are multiple packets (n_rx_pkts) and if pkt_bundle_len might be the
one to check. Also if there needs to be a check that the len > sizeof
HTC HDR.

On Tue, Dec 31, 2019 at 1:37 AM <wgong@codeaurora.org> wrote:
>
> On 2019-12-25 23:14, Justin Capella wrote:
> > This does not only effect SDIO.
> >
> > Why a semaphore / count? Could the conf_mutex be held earlier, or
> > perhaps change the state to ATH10K_STATE_RESTARTING first?
> > ath10k_reconfig_complete is also called in mac.c when channel is
> > changed so
> patch v2:
> https://patchwork.kernel.org/patch/11313853/
> https://patchwork.kernel.org/patch/11313859/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
