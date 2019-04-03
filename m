Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBnq8-0007p6-Hr
 for ath10k@lists.infradead.org; Wed, 03 Apr 2019 21:54:38 +0000
Received: by mail-lf1-x144.google.com with SMTP id m13so236477lfb.6
 for <ath10k@lists.infradead.org>; Wed, 03 Apr 2019 14:54:36 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177])
 by smtp.gmail.com with ESMTPSA id z83sm3518009ljb.48.2019.04.03.14.54.31
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Apr 2019 14:54:32 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id l7so224906ljg.6
 for <ath10k@lists.infradead.org>; Wed, 03 Apr 2019 14:54:31 -0700 (PDT)
MIME-Version: 1.0
References: <2884043.Jv1Mn93hE8@aspire.rjw.lan>
 <20190403195718.GA74723@google.com>
 <1645947.WPhbVaNX0l@aspire.rjw.lan>
In-Reply-To: <1645947.WPhbVaNX0l@aspire.rjw.lan>
From: Brian Norris <briannorris@chromium.org>
Date: Wed, 3 Apr 2019 14:54:19 -0700
Message-ID: <CA+ASDXPoB94o0pbY0TQGS7Dtp2RNz=3goH38gpLtBoJ15i7eoQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Drop WARN_ON()s that always trigger during system
 resume
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
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Claire Chang <tientzu@google.com>, Sriram R <srirrama@codeaurora.org>, Linux PM <linux-pm@vger.kernel.org>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Todd Brandt <todd.e.brandt@intel.com>, Kalle Valo <kvalo@codeaurora.org>

On Wed, Apr 3, 2019 at 2:47 PM Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> I have been wondering whether or not I need to resend this patch or something ...

I think the linux-wireless Patchwork instance is the source of truth
-- Kalle and Johannes use it for tracking status, IIUC. So this says
your patch is still "New":

https://patchwork.kernel.org/patch/10837139/

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
