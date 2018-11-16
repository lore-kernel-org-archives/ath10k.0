Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNlTO-00009V-6H
 for ath10k@lists.infradead.org; Fri, 16 Nov 2018 21:16:19 +0000
Received: by mail-io1-xd41.google.com with SMTP id r7-v6so18000308iog.7
 for <ath10k@lists.infradead.org>; Fri, 16 Nov 2018 13:16:07 -0800 (PST)
Received: from mail-it1-f181.google.com (mail-it1-f181.google.com.
 [209.85.166.181])
 by smtp.gmail.com with ESMTPSA id r9sm5101026iop.8.2018.11.16.13.16.05
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Nov 2018 13:16:05 -0800 (PST)
Received: by mail-it1-f181.google.com with SMTP id k206-v6so36900840ite.0
 for <ath10k@lists.infradead.org>; Fri, 16 Nov 2018 13:16:05 -0800 (PST)
MIME-Version: 1.0
References: <20181107185643.240346-1-briannorris@chromium.org>
 <7f2ef494f4a2aba1845a157da8fec449@codeaurora.org>
 <b1a64bd66fa25f274af8c018c6fc02f4@codeaurora.org>
 <CA+ASDXOqJ1-G2amyu7sJCnzKf1oY_2j9Qw4WS0VTf8EqGr6Uqw@mail.gmail.com>
 <87k1ld72ho.fsf@codeaurora.org>
In-Reply-To: <87k1ld72ho.fsf@codeaurora.org>
From: Brian Norris <briannorris@chromium.org>
Date: Fri, 16 Nov 2018 13:15:52 -0800
Message-ID: <CA+ASDXNOaZ3oWttEm9M4fQPjjHCfNi34VPTmKd9whE7xsQUVLw@mail.gmail.com>
Subject: Re: [PATCH REGRESSION] Revert "ath10k: add quiet mode support for
 QCA6174/QCA9377"
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: yyuwang@codeaurora.org, rmanohar@codeaurora.org, linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, govinds@codeaurora.org, pillair@codeaurora.org, stable <stable@vger.kernel.org>

On Fri, Nov 16, 2018 at 2:15 AM Kalle Valo <kvalo@codeaurora.org> wrote:
> Thanks Brian for investigating this and providing the revert!

I think Govind did most of the investigation, but I did at least do
the hard work of submitting the revert ;)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
