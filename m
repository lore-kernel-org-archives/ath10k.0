Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YY9Yq-0008Sl-2W
 for ath10k@lists.infradead.org; Wed, 18 Mar 2015 08:42:44 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add firmware 10.2.4.45 as firmware-4.bin
References: <1426160112-4261-1-git-send-email-kvalo@qca.qualcomm.com>
 <20150313204730.GA30928@merlin.infradead.org>
Date: Wed, 18 Mar 2015 10:42:12 +0200
In-Reply-To: <20150313204730.GA30928@merlin.infradead.org> (Kyle McMartin's
 message of "Fri, 13 Mar 2015 16:47:30 -0400")
Message-ID: <87lhiuofx7.fsf@kamboji.qca.qualcomm.com>
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
To: Kyle McMartin <kyle@infradead.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, linux-firmware@kernel.org

Kyle McMartin <kyle@infradead.org> writes:

> On Thu, Mar 12, 2015 at 01:35:12PM +0200, Kalle Valo wrote:
>> This is the latest firmware from 10.2.4 firmware branch.
>> 
>> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
>
> Pardon my ignorance... It looks like your driver needs more than just
> firmware-4.bin... How are distros supposed to use this? Symlink it into
> firmware.bin which it seems the driver looks for?

The current version of ath10k uses firmware-4.bin. Distros should not
create symlinks or anything like that.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
