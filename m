Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y3TUh-0003F8-OD
 for ath10k@lists.infradead.org; Tue, 23 Dec 2014 17:43:40 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 8/8] ath10k: add thermal sensor device support
References: <20141217101755.15964.2625.stgit@potku.adurom.net>
 <20141217102226.15964.32919.stgit@potku.adurom.net>
 <5491D20F.2020202@dd-wrt.com>
Date: Tue, 23 Dec 2014 19:43:06 +0200
In-Reply-To: <5491D20F.2020202@dd-wrt.com> (Sebastian Gottschall's message of
 "Wed, 17 Dec 2014 19:57:19 +0100")
Message-ID: <87tx0mcled.fsf@kamboji.qca.qualcomm.com>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:

> the whole code will not work. the firmware 10.2.4 returns op_version 3
> so this check here fails
>
> if (ar->wmi.op_version != ATH10K_FW_WMI_OP_VERSION_10_2_4)
>
> since 5 is required

I know, I used firmware-4.bin_10.2.4.13-2 to test this. I just didn't
have a chance to upload it until now:

https://github.com/kvalo/ath10k-firmware/tree/master/10.2.4

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
