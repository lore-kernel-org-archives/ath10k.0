Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqGsR-0000FT-6s
 for ath10k@lists.infradead.org; Wed, 13 Apr 2016 09:14:23 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/3]  ath10k: add a support of set_tsf on vdev interface
Date: Wed, 13 Apr 2016 09:13:40 +0000
Message-ID: <87ega9ub0c.fsf@kamboji.qca.qualcomm.com>
References: <1459811956-26186-1-git-send-email-poh@qca.qualcomm.com>
In-Reply-To: <1459811956-26186-1-git-send-email-poh@qca.qualcomm.com> (Peter
 Oh's message of "Mon, 4 Apr 2016 16:19:13 -0700")
Content-Language: en-US
Content-ID: <951BAB8651FA864EAAA958313F73DBB6@qualcomm.com>
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
To: "Oh, Peter" <poh@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Peter Oh <poh@qca.qualcomm.com> writes:

> 10.2.4 and 10.4 firmware has introduced new function to
> set TSF via vdev parameter.
> set_tsf function can be used to shift TBTT that will help
> avoid its clockdrift which happens when beacons are collided.
>
> Peter Oh (3):
>   ath10k: add a support of set_tsf on vdev interface
>   ath10k: update 10.4 WMI vdev parameters
>   ath10k: enable set_tsf vdev command to WMI 10.4

Series applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
