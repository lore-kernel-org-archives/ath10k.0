Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAFCr-0001d5-Iu
 for ath10k@lists.infradead.org; Tue, 07 Jun 2016 11:30:02 +0000
MIME-Version: 1.0
Subject: Re: [1/2] ath10k: add QCA9887 chipset support
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1463755272-12912-1-git-send-email-sven.eckelmann@open-mesh.com>
Message-ID: <d77ac566725940fa90cd014198ffb030@euamsexm01a.eu.qualcomm.com>
Date: Tue, 7 Jun 2016 13:29:19 +0200
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
To: Sven Eckelmann <sven.eckelmann@open-mesh.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sven Eckelmann <sven.eckelmann@open-mesh.com> wrote:
> Add the hardware name, revision, firmware names and update the pci_id
> table.
> 
> QA9887 HW1.0 is supposed to be similar to QCA988X HW2.0 . Details about
> he firmware interface are currently unknown.
> 
> Signed-off-by: Sven Eckelmann <sven.eckelmann@open-mesh.com>

Thanks, 2 patches applied to ath-next branch of ath.git:

6fd3dd716091 ath10k: add QCA9887 chipset support
6847f9673391 ath10k: add board data download from target

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9129717/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
