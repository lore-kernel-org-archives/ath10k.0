Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-01.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1djwuI-0005fI-SK
 for ath10k@lists.infradead.org; Tue, 22 Aug 2017 00:19:00 +0000
From: Ryan Hsu <ryanhsu@qti.qualcomm.com>
Subject: Re: [PATCH] ath10k: sdio: remove unused struct member
Date: Tue, 22 Aug 2017 00:18:14 +0000
Message-ID: <a97bab8e-fd91-715d-918e-0074fe0ac3d6@qti.qualcomm.com>
References: <1503153382-11100-1-git-send-email-erik.stromdahl@gmail.com>
In-Reply-To: <1503153382-11100-1-git-send-email-erik.stromdahl@gmail.com>
Content-Language: en-US
Content-ID: <BAD33E727CAB804A826A9E4B09FC0539@qualcomm.com>
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 08/19/2017 07:36 AM, Erik Stromdahl wrote:

> irq_wq in struct ath10k_sdio is a remnant from an earlier
> version of the sdio patchset.
>
> It's use was removed as a result of Kalle's review, but somehow

Its?

-- 
Ryan Hsu

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
