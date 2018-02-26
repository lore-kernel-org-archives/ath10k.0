Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eqKEq-0006Pb-U6
 for ath10k@lists.infradead.org; Mon, 26 Feb 2018 14:58:55 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PULL] ath10k firmware 20180219
References: <87y3jlxq0k.fsf@kamboji.qca.qualcomm.com>
 <0e9db63d-41e9-eeb3-00d1-73b20df4bb3f@dd-wrt.com>
Date: Mon, 26 Feb 2018 16:58:33 +0200
In-Reply-To: <0e9db63d-41e9-eeb3-00d1-73b20df4bb3f@dd-wrt.com> (Sebastian
 Gottschall's message of "Thu, 22 Feb 2018 11:59:02 +0100")
Message-ID: <87606ju7ae.fsf@kamboji.qca.qualcomm.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "linux-firmware@kernel.org" <linux-firmware@kernel.org>

Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:

> on 9984 i see these messages with this firmware from time to time
>
> [272972.950788] ath10k_pci 0000:01:00.0: Unknown eventid: 36925
> [272982.868922] ath10k_pci 0000:01:00.0: Unknown eventid: 36925
> [335550.123780] ath10k_pci 0000:01:00.0: Unknown eventid: 36925
> [335550.156332] ath10k_pci 0000:01:00.0: Unknown eventid: 36925
> [335550.158813] ath10k_pci 0000:01:00.0: Unknown eventid: 36925
> [335550.193144] ath10k_pci 0000:01:00.0: Unknown eventid: 36925
> [365157.869540] ath10k_pci 0000:01:00.0: Unknown eventid: 36925
> [365157.902452] ath10k_pci 0000:01:00.0: Unknown eventid: 36925
>
>
> according to the WMI header this maybe a critical internal error

Thanks for the report. We are working on a fix but just ignore the
warning for now.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
