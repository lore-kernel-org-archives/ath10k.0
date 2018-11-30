Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it1-x133.google.com ([2607:f8b0:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSptW-0007pd-Uh
 for ath10k@lists.infradead.org; Fri, 30 Nov 2018 21:00:16 +0000
Received: by mail-it1-x133.google.com with SMTP id o19so516689itg.5
 for <ath10k@lists.infradead.org>; Fri, 30 Nov 2018 13:00:03 -0800 (PST)
Received: from mail-it1-f177.google.com (mail-it1-f177.google.com.
 [209.85.166.177])
 by smtp.gmail.com with ESMTPSA id a10sm135337itc.3.2018.11.30.13.00.01
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Nov 2018 13:00:01 -0800 (PST)
Received: by mail-it1-f177.google.com with SMTP id b5so482151iti.2
 for <ath10k@lists.infradead.org>; Fri, 30 Nov 2018 13:00:01 -0800 (PST)
MIME-Version: 1.0
References: <20181129042522.11767-1-govinds@codeaurora.org>
In-Reply-To: <20181129042522.11767-1-govinds@codeaurora.org>
From: Brian Norris <briannorris@chromium.org>
Date: Fri, 30 Nov 2018 12:59:49 -0800
Message-ID: <CA+ASDXMOqzXk9HrX9AS58cUfKOHeXA7zN_ME3+zDZXQcok_0Tg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Move non-fatal warn logs to dbg level
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
To: govinds@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Wed, Nov 28, 2018 at 8:25 PM Govind Singh <govinds@codeaurora.org> wrote:
>
> During driver load below warn logs are printed in the console.
> Since driver may not implement all wmi events sent by fw and
> all of them are non-fatal, move this log to debug level to
> remove un-necessary warn message on console.
>
> [  361.887230] ath10k_snoc a000000.wifi: Unknown eventid: 16393
> [  361.907037] ath10k_snoc a000000.wifi: Unknown eventid: 237569
>
> Signed-off-by: Govind Singh <govinds@codeaurora.org>

Alternatively, you could add these ignored commands to wmi-tlv.h, and
just ignore them specifically. That's better documentation, in case
new WMI events come along that *are* important to notice when we
ignore them. There are other recent examples of that sort of patch
being merged.

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
