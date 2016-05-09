Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-x22e.google.com ([2607:f8b0:4001:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aztOE-00053e-1j
 for ath10k@lists.infradead.org; Mon, 09 May 2016 22:10:58 +0000
Received: by mail-ig0-x22e.google.com with SMTP id s8so103797376ign.0
 for <ath10k@lists.infradead.org>; Mon, 09 May 2016 15:10:37 -0700 (PDT)
Date: Mon, 9 May 2016 18:10:34 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: [ath6kl:master 1344/1352] net/ipv4/ip_gre.c:138:15: error:
 redefinition of 'gre_flags_to_tnl_flags'
Message-ID: <20160509221034.GB2468@localhost>
References: <201605100555.J4I0pjyS%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201605100555.J4I0pjyS%fengguang.wu@intel.com>
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
To: kbuild test robot <fengguang.wu@intel.com>
Cc: "Kalle Valo <kvalo@adurom.com> Kalle Valo" <kvalo@adurom.com>, kbuild-all@01.org, ath10k@lists.infradead.org

On Tue, May 10, 2016 at 05:51:06AM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
> head:   140eb352c0398fd9c361e0fded58055c893db482
> commit: 13e441e25c7c41683748ffc48a30a83fa2e4ea7b [1344/1352] Merge remote-tracking branch 'wireless-drivers-next/master'
> config: x86_64-rhel (attached as .config)
> compiler: gcc-4.9 (Debian 4.9.3-14) 4.9.3
> reproduce:
>         git checkout 13e441e25c7c41683748ffc48a30a83fa2e4ea7b
>         # save the attached .config to linux build tree
>         make ARCH=x86_64 
> 
> Note: the ath6kl/master HEAD 140eb352c0398fd9c361e0fded58055c893db482 builds fine.
>       It only hurts bisectibility.
> 
> All errors (new ones prefixed by >>):

This is just a bit of merge damage from a patch that went into
both -rc7 and net-next.  I kept more than I should have from the
rc7 version, causing the build warnings.

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
