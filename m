Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bugI1-0004aZ-HG
 for ath10k@lists.infradead.org; Thu, 13 Oct 2016 13:43:18 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix debug cal data file
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1474341984-19220-1-git-send-email-mar.kolya@gmail.com>
References: <1474341984-19220-1-git-send-email-mar.kolya@gmail.com>
Message-ID: <21deaa8b2e7a4765bead3b77da17de49@euamsexm01a.eu.qualcomm.com>
Date: Thu, 13 Oct 2016 15:42:32 +0200
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
To: Nikolay Martynov <mar.kolya@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Nikolay Martynov <mar.kolya@gmail.com> wrote:
> It got broken by 0b8e3c4ca29fe2c0efd3d41a76e34a657b9f17a4
> 
> Signed-off-by: Nikolay Martynov <mar.kolya@gmail.com>

Actually Marty's patch fixed this in a better way so I actually took that
instead:

f67b107d4ced ath10k: cache calibration data when the core is stopped

-- 
https://patchwork.kernel.org/patch/9340953/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
