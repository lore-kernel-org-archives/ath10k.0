Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bQ87g-0008Q5-91
 for ath10k@lists.infradead.org; Thu, 21 Jul 2016 07:10:21 +0000
Date: Thu, 21 Jul 2016 09:09:39 +0200
From: Stanislaw Gruszka <sgruszka@redhat.com>
Subject: Re: [RFC] ath10k: silence firmware file probing warnings
Message-ID: <20160721070938.GA2658@redhat.com>
References: <1468933237-5226-1-git-send-email-michal.kazior@tieto.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1468933237-5226-1-git-send-email-michal.kazior@tieto.com>
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
Cc: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Tue, Jul 19, 2016 at 03:00:37PM +0200, Michal Kazior wrote:
> Firmware files are versioned to prevent older
> driver instances to load unsupported firmware
> blobs. This is reflected with a fallback logic
> which attempts to load several firmware files.
> 
> This however produced a lot of unnecessary
> warnings sometimes confusing users and leading
> them to rename firmware files making things even
> more confusing.

This happens on kernels configured with
CONFIG_FW_LOADER_USER_HELPER_FALLBACK and cause not only ugly warnings,
but also 60 seconds delay before loading next firmware version.
For some reason RHEL kernel needs above config option, so this
patch is very welcome from my perspective.

Stanislaw

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
