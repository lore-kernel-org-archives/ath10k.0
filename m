Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZjQjO-0007Nb-Mq
 for ath10k@lists.infradead.org; Tue, 06 Oct 2015 11:48:31 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: use Rx decap mode configured when driver
 registered
References: <1443042740-31928-1-git-send-email-poh@qca.qualcomm.com>
Date: Tue, 6 Oct 2015 14:47:59 +0300
In-Reply-To: <1443042740-31928-1-git-send-email-poh@qca.qualcomm.com> (Peter
 Oh's message of "Wed, 23 Sep 2015 14:12:20 -0700")
Message-ID: <878u7g2p74.fsf@kamboji.qca.qualcomm.com>
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

> ath10k is using Native WiFi mode as default mode for both of
> Tx and Rx path, but it could be changed when driver registers
> with a module parameter for specific purpose such as mesh.
>
> The Rx decap mode sent to firmware during WMI initialization should
> use the same mode that driver configured at its registration stage
> in case of using raw mode, so that host driver receives MAC frame
> header containing necessary fields such as QoS and Mesh Control
> and uses them in right way to make data traffic work.
>
> Signed-off-by: Peter Oh <poh@qca.qualcomm.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
