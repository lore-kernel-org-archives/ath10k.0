Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VGkc5-0007ey-DO
 for ath10k@lists.infradead.org; Tue, 03 Sep 2013 07:01:22 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/2] ath10k: detect hw1.0 boards
References: <20130901082007.1930.79088.stgit@localhost6.localdomain6>
Date: Tue, 3 Sep 2013 10:00:50 +0300
In-Reply-To: <20130901082007.1930.79088.stgit@localhost6.localdomain6> (Kalle
 Valo's message of "Sun, 01 Sep 2013 11:22:06 +0300")
Message-ID: <87ioyi1ja5.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Here's a patchset which detects hw1.0 from the
> chip id register and fails the probe if found.
>
> v2:
>
> o use SOC_CHIP_ID_REV_MASK
>
> o move detection to core.c so that it's not just PCI
>   specific
>
> o add debugfs file for reading the chip id
>
> ---
>
> Kalle Valo (2):
>       ath10k: check chip id from the soc register during probe
>       ath10k: add chip_id file to debugfs

Both patches applied, but I fixed the commit log in patch 1 based on the
discussion.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
