Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XAgL0-0003e4-6U
 for ath10k@lists.infradead.org; Fri, 25 Jul 2014 14:19:11 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add support for 10.2 firmware
References: <1406287937-26507-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 25 Jul 2014 17:18:40 +0300
In-Reply-To: <1406287937-26507-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 25 Jul 2014 13:32:17 +0200")
Message-ID: <87y4vhmshr.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> The 10.2 firmware is a successor of 10.1 firmware
> (formerly identified as 10.x). Both share a lot
> but have some slight ABI differences that need to
> be taken care of.
>
> The 10.2 firmware introduces some new features but
> those can be added in subsequent patches. This
> patch makes ath10k boot and work with 10.2 with
> comparable functionality to 10.1.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Anyone who wants to test this, the firmware image is here:

https://github.com/kvalo/ath10k-firmware/tree/master/10.2

Because of backwards compatibility the firmware image name needs to be
firmware-3.bin for 10.2 branch.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
