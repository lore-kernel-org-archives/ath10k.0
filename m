Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3Q41-00071f-BU
 for ath10k@lists.infradead.org; Mon, 30 Nov 2015 15:08:25 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/3] ath10k: introduce Mesh support in native WiFi mode
 for QCA988X
References: <1448386655-13936-1-git-send-email-poh@qca.qualcomm.com>
Date: Mon, 30 Nov 2015 17:07:52 +0200
In-Reply-To: <1448386655-13936-1-git-send-email-poh@qca.qualcomm.com> (Peter
 Oh's message of "Tue, 24 Nov 2015 09:37:32 -0800")
Message-ID: <87lh9fikzb.fsf@kamboji.qca.qualcomm.com>
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
To: Peter Oh <poh@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Peter Oh <poh@qca.qualcomm.com> writes:

> QCA988X firmware has started supporting Mesh frame in native Wi-Fi mode
> by adding its subtype since 10.2.4.70.12-2.
> Hence update its WMI service map and vdev subtypes to be used for Mesh in
> native Wi-Fi mode.
>
> Peter Oh (3):
>   ath10k: update WMI 10.x service map
>   ath10k: introduce new subtypes for proxy STA and Mesh
>   ath10k: apply Mesh subtype when Mesh interface created.

All three applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
