Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YL6AU-0000ks-LH
 for ath10k@lists.infradead.org; Tue, 10 Feb 2015 08:27:39 +0000
Received: by iery20 with SMTP id y20so14521381ier.9
 for <ath10k@lists.infradead.org>; Tue, 10 Feb 2015 00:27:13 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 10 Feb 2015 09:27:13 +0100
Message-ID: <CADnKcViRWR1Ex-=QGzROQGYKNcZLMSu+mLDJ8-KhUuf=acDXdQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix wmm params per vdev
From: Marek Puzyniak <marek.puzyniak@tieto.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 6 February 2015 at 14:41, Marek Puzyniak <marek.puzyniak@tieto.com> wrote:
> During wmm tests changing wmm parameters did not change anything.
> This was because of mismatch in WMM params per vdev command.
> WMM params per vdev uses different command structure than wmm params
> per pdev command. Also txop for per vdev settings has the
> same units as provided by mac80211.
>
> Patch concerns qca6174.
>
> Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>

Kalle,

Please do not merge this patch yet. I need to clarify some side effects.
I will inform you about next steps.

Thanks,
Marek

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
