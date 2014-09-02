Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XOoI9-0006o3-0A
 for ath10k@lists.infradead.org; Tue, 02 Sep 2014 13:38:37 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v5] ath10k:  save firmware debug log messages.
References: <1409239441-4878-1-git-send-email-greearb@candelatech.com>
Date: Tue, 2 Sep 2014 16:38:09 +0300
In-Reply-To: <1409239441-4878-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Thu, 28 Aug 2014 08:24:01
 -0700")
Message-ID: <8738cam9by.fsf@kamboji.qca.qualcomm.com>
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
To: greearb@candelatech.com
Cc: ath10k@lists.infradead.org

(Dropping linux-wireless)

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> They may be dumped through the firmware dump debugfs
> file.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

Before I start looking at this in detail: this looks fragile and
complicated from ath10k point of view. Why not just take a dump of the
whole firmware memory and postprocess this, with whatever else we might
need from the firmware? That's a lot easier to maintain.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
