Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s72.web-hosting.com ([198.187.29.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHNPa-0008Id-58
 for ath10k@lists.infradead.org; Sat, 31 Jan 2015 02:03:50 +0000
From: Sujith Manoharan <sujith@msujith.org>
MIME-Version: 1.0
Message-ID: <21708.14493.458370.65799@gargle.gargle.HOWL>
Date: Sat, 31 Jan 2015 07:36:21 +0530
Subject: Re: [PATCH] ath10k: Replace ioread with wmb for data sync
In-Reply-To: <54CC3640.2090209@codeaurora.org>
References: <1422311118-11320-1-git-send-email-poh@qca.qualcomm.com>
 <20150127213349.GA24933@localhost>
 <54C824DC.5080804@qca.qualcomm.com>
 <20150128043005.GB24933@localhost>
 <54C875FD.3070101@qca.qualcomm.com>
 <1422430643.1973.1.camel@sipsolutions.net>
 <54CC0B71.9050301@codeaurora.org>
 <21708.11481.380046.994311@gargle.gargle.HOWL>
 <54CC3640.2090209@codeaurora.org>
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
To: Peter Oh <poh@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, Bob Copeland <me@bobcopeland.com>, Peter Oh <poh@qca.qualcomm.com>, ath10k@lists.infradead.org

Peter Oh wrote:
> Please refer the email thread that I mentioned about other architectures.
> (dsb is for ARM and other platforms have the equivalent instruction such 
> as sfence, sync, mf, and dcs).

Ok.

> Also the patch is updated with 2nd patch set replacing wmb to mb.

Would be good to test this on a MIPS platform...

Sujith

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
