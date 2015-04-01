Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdObv-0002eo-Sg
 for ath10k@lists.infradead.org; Wed, 01 Apr 2015 19:47:36 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix IBSS scanning on wmi-tlv and qca6174
References: <1427202843-9172-1-git-send-email-michal.kazior@tieto.com>
Date: Wed, 1 Apr 2015 22:47:03 +0300
In-Reply-To: <1427202843-9172-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 24 Mar 2015 13:14:03 +0000")
Message-ID: <87zj6rws08.fsf@kamboji.qca.qualcomm.com>
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

> WLAN.RM.2.0-00073 firmware requires self-peer to
> be created prior to issuing scan command. Without
> this wmi-tlv with qca6174 firmware crashes after
> submitting a scan request.
>
> Creating the peer as soon as add_interface()
> shouldn't be a problem.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
