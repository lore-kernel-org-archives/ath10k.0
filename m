Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x233.google.com ([2a00:1450:400c:c0c::233])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eTVLW-0005YS-U3
 for ath10k@lists.infradead.org; Mon, 25 Dec 2017 16:11:24 +0000
Received: by mail-wr0-x233.google.com with SMTP id o2so33132930wro.5
 for <ath10k@lists.infradead.org>; Mon, 25 Dec 2017 08:11:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5281f48b04f8f593ec06e72a041ec021@silex-india.com>
References: <1506793068-27445-1-git-send-email-alagusankar@silex-india.com>
 <1506793068-27445-4-git-send-email-alagusankar@silex-india.com>
 <87lghu9247.fsf@kamboji.qca.qualcomm.com>
 <5281f48b04f8f593ec06e72a041ec021@silex-india.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Mon, 25 Dec 2017 08:11:09 -0800
Message-ID: <CAJ-Vmon-KSR4JOMspwFC6YO2DHJW6mRL1b=6F++X8zJX=di2qg@mail.gmail.com>
Subject: Re: [PATCH 03/11] ath10k_sdio: DMA bounce buffers for read write
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
To: Alagu Sankar <alagusankar@silex-india.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, silexcommon@gmail.com, ath10k@lists.infradead.org

Hi,

I think Kalle is pointing out that maybe it's the SDHCI driver
responsibility to do the bounce buffering?



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
