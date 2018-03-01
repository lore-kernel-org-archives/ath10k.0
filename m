Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by merlin.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1erLDq-0000fj-2Y
 for ath10k@lists.infradead.org; Thu, 01 Mar 2018 10:13:59 +0000
From: Govind Singh <govinds@qti.qualcomm.com>
Subject: RE: [PATCH 01/13] ath10k: platform driver for WCN3990 SNOC WLAN module
Date: Thu, 1 Mar 2018 10:13:35 +0000
Message-ID: <d396df1b09da4dd7aa14d6af2c2b2b18@aphydexm01b.ap.qualcomm.com>
References: <1518684458-5338-1-git-send-email-govinds@codeaurora.org>
 <87371kqfda.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87371kqfda.fsf@kamboji.qca.qualcomm.com>
Content-Language: en-US
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
To: Kalle Valo <kvalo@codeaurora.org>, Govind Singh <govinds@codeaurora.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi Kalle,

I didn't encountered this issue as in my defconfig only CONFIG_ATH10K_SNOC was defined.
This problem is coming when we define CONFIG_ATH10K_SNOC and CONFIG_ATH10K_PCI simultaneously in defconfig and this is 
known issue when multiple modules share objects(in this case ce.o). I saw similar reported problem and found https://patchwork.kernel.org/patch/10060825/.

After picking the below change issue is not seen.

BR,
Govind

-----Original Message-----
From: ath10k [mailto:ath10k-bounces@lists.infradead.org] On Behalf Of Kalle Valo
Sent: Thursday, March 1, 2018 3:37 PM
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org; ath10k@lists.infradead.org
Subject: Re: [PATCH 01/13] ath10k: platform driver for WCN3990 SNOC WLAN module

Govind Singh <govinds@codeaurora.org> writes:

> WCN3990 is integrated 802.11ac chipset with SNOC bus interface. Add 
> snoc layer driver registration and associated ops.
>
> WCN3990 support is not yet complete as cold-boot handshake is done 
> using qmi(Qualcomm-MSM-Interface) and qmi client support will be added 
> once qmi framework is available.
>
> Signed-off-by: Govind Singh <govinds@codeaurora.org>

Kbuild bot found an odd problem with this patch:

 include/linux/dynamic_debug.h:77:14: error: 'KBUILD_MODNAME'
 undeclared (first use in this function); did you mean  'KBUILD_BASENAME'?

Full report:

http://lists.infradead.org/pipermail/ath10k/2018-February/010907.html

Any ideas? Is this is some unrelated issue or what? This patch is not even touching hif.h or ce.c.

--
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
