Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YC5vm-0004FL-HW
 for ath10k@lists.infradead.org; Fri, 16 Jan 2015 12:23:15 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC 0/8] ath10k: add multi-channel support
References: <1420802049-11962-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 16 Jan 2015 14:22:28 +0200
In-Reply-To: <1420802049-11962-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 9 Jan 2015 12:14:01 +0100")
Message-ID: <877fwmnce3.fsf@kamboji.qca.qualcomm.com>
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

> New wmi-tlv firmware and new hardware will support
> multi-channel operation.
>
> This prepares the driver by implementing chanctx,
> improves tx queue locking and introduces initial
> interface combinations.
>
> I'm posting this as an RFC first because I'd like
> to get some early feedback (if possible) while I
> upstream other patches this patchset is basing on.
>
>
> Michal Kazior (8):
>   ath10k: defer AP self-peer removal wait
>   ath10k: allow empty ssid vdev config
>   ath10k: implement chanctx API
>   ath10k: implement adaptive qcs command
>   ath10k: protect ar->arvifs linking with data_lock
>   ath10k: rework tx queue locking
>   ath10k: implement tx pause wmi event
>   ath10k: add proper wmi-tlv combinations

From a quick review looks good to me. Sorry for taking so long with
this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
