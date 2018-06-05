Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQKvn-0001UO-PJ
 for ath10k@lists.infradead.org; Tue, 05 Jun 2018 23:00:01 +0000
Received: by mail-pg0-x242.google.com with SMTP id q4-v6so907583pgr.1
 for <ath10k@lists.infradead.org>; Tue, 05 Jun 2018 15:59:49 -0700 (PDT)
Date: Tue, 5 Jun 2018 15:59:45 -0700
From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v2 0/6]  *** Add support for wifi QMI client driver ***
Message-ID: <20180605225944.GA194157@rodete-desktop-imager.corp.google.com>
References: <20180605123304.31969-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180605123304.31969-1-govinds@codeaurora.org>
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
To: Govind Singh <govinds@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org

On Tue, Jun 05, 2018 at 06:03:04PM +0530, Govind Singh wrote:
> Add QMI client driver for Q6 integrated WLAN connectivity subsystem.
> This module is responsible for communicating WLAN control messages to FW
> over QMI interface.
...

You still don't have the threading correct. Your patches should be
In-Reply-To the cover letter, so they get threaded by mail clients.

See, for instance, how the threaded view for your last version doesn't
show any of your patches:

https://www.mail-archive.com/linux-wireless@vger.kernel.org/msg44199.html

(And Bjorn complained about this last time too.)

It looks like you're already using git-send-email, which should handle
this for you...just make sure you're sending all emails in one go (e.g.,
'git send-email <args> 0000-foo.patch 0001-bar.patch 0002-baz.patch
...').

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
