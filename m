Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp-out.xnet.cz ([178.217.244.18])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCRPk-0007ZI-9s
 for ath10k@lists.infradead.org; Fri, 05 Apr 2019 16:10:01 +0000
Received: from meh.true.cz (meh.true.cz [108.61.167.218])
 (Authenticated sender: petr@true.cz)
 by smtp-out.xnet.cz (Postfix) with ESMTPSA id BDEF13DD6
 for <ath10k@lists.infradead.org>; Fri,  5 Apr 2019 18:09:58 +0200 (CEST)
Received: from localhost (meh.true.cz [local])
 by meh.true.cz (OpenSMTPD) with ESMTPA id a3c0d93b
 for <ath10k@lists.infradead.org>;
 Fri, 5 Apr 2019 18:09:57 +0200 (CEST)
Date: Fri, 5 Apr 2019 18:09:57 +0200
From: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Subject: Re: Kernel crash in skb_put caused by ath10k_htt_t2h_msg_handler
Message-ID: <20190405160957.GI41661@meh.true.cz>
References: <20190405092457.GE41661@meh.true.cz>
 <13451ca6-d102-0d19-7cb9-450b04c5f06f@candelatech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13451ca6-d102-0d19-7cb9-450b04c5f06f@candelatech.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hi,

while searching for the kmod with the same md5sum as the one used on the
device, I've found out, that OpenWrt is not using upstream ath10k kernel
module, so I don't want to make more noise on the ath10k mailing list, and
I've moved the discussion to the openwrt-devel mailing list[1].

Sorry for the noise.

1. http://lists.infradead.org/pipermail/openwrt-devel/2019-April/016614.html

-- ynezz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
