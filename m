Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGnWs-0008Ud-9P
 for ath10k@lists.infradead.org; Tue, 24 Mar 2020 17:39:55 +0000
Received: by mail-wm1-x344.google.com with SMTP id 26so3058704wmk.1
 for <ath10k@lists.infradead.org>; Tue, 24 Mar 2020 10:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAG2Q2vXt3af3ATRnFNW8bA2BbaQ47fLsS1dL1iJ6JGQg=kbJSQ@mail.gmail.com>
 <87ftdy7y3b.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87ftdy7y3b.fsf@kamboji.qca.qualcomm.com>
From: Cale Collins <ccollins@gateworks.com>
Date: Tue, 24 Mar 2020 10:39:16 -0700
Message-ID: <CAG2Q2vWuGMooJJ+yiU+gBPBOubbokkLuC9JUJSf0jiF9stAFKg@mail.gmail.com>
Subject: Re: ath10k_pci rawmode = 1 requires support from firmware
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k <ath10k@lists.infradead.org>

Hello Kalle,

Ultimately I ended up using the 5.4 kernel and
firmware-6.bin_WLAN.RM.4.4.1.c3-00038. This firmware didn't work with
"iw" and required custom building "wpa_supplicant" with
"CONFIG_MESH=y" enabled in the .config.

I apologize for leaving the thread hanging, I was vacillating if this
information would be prudent or considered a regression. I'm glad to
do further testing (with the latest mainline kernel) if you need.

Best regards,

Cale Collins

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
