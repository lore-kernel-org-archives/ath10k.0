Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YFfgq-0003od-TY
 for ath10k@lists.infradead.org; Mon, 26 Jan 2015 09:10:37 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/3] ath10k: add support for qca6174
References: <1421407237-24159-1-git-send-email-michal.kazior@tieto.com>
 <1421407237-24159-3-git-send-email-michal.kazior@tieto.com>
Date: Mon, 26 Jan 2015 11:10:00 +0200
In-Reply-To: <1421407237-24159-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 16 Jan 2015 12:20:37 +0100")
Message-ID: <87wq49gb6f.fsf@kamboji.qca.qualcomm.com>
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

> The QCA6174 in combination with new wmi-tlv
> firmware is capable of multi-channel, beamforming,
> tdls and other features.
>
> This patch just makes it possible to boot these
> devices and do some basic stuff. Some things may
> not work or may be unreliable. New features will
> be implemented later. This will be addressed
> eventually with future patches.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> +++ b/drivers/net/wireless/ath/ath10k/hw.c
> @@ -0,0 +1,59 @@
> +/*
> + * Copyright (c) 2005-2011 Atheros Communications Inc.
> + * Copyright (c) 2011-2014 Qualcomm Atheros, Inc.

I think this needs to be:

Copyright (c) 2014-2015 Qualcomm Atheros, Inc.

I can change that.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
