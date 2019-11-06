Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSI8D-0006BG-QI
 for ath10k@lists.infradead.org; Wed, 06 Nov 2019 10:01:43 +0000
Received: by mail-oi1-x242.google.com with SMTP id v138so20419083oif.6
 for <ath10k@lists.infradead.org>; Wed, 06 Nov 2019 02:01:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <9bb484b94c43f7c9aa08345ad89d7b2c@codeaurora.org>
References: <1571734629-18028-1-git-send-email-zhichen@codeaurora.org>
 <CAKR_QVLDFBVMDDP4mPYVNdpT9TA3podNeQMpVJQwE7A5eG=0kA@mail.gmail.com>
 <9bb484b94c43f7c9aa08345ad89d7b2c@codeaurora.org>
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Wed, 6 Nov 2019 11:01:38 +0100
Message-ID: <CAKR_QVL9QLE72y0HBD_miLYAD4qx73u3FK33=oNCHp_S8H6JOw@mail.gmail.com>
Subject: Re: [PATCH RFC] Revert "ath10k: fix DMA related firmware crashes on
 multiple devices"
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
To: zhichen@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 30/10/2019, zhichen@codeaurora.org <zhichen@codeaurora.org> wrote:
> On 2019-10-22 18:07, Tom Psyborg wrote:
>
>> What about main and 10x firmware branch?
>
> There is no code changes in firmware. It's a configuration change of
> host memory access.
>
> Zhi
>

Please change it for main and 10x branch too. Dumping hw1.0 regs with
QCA driver shows DMA burst value set to 1

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
