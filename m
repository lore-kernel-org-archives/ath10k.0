Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YL5EC-0003Uv-42
 for ath10k@lists.infradead.org; Tue, 10 Feb 2015 07:27:24 +0000
Date: Tue, 10 Feb 2015 12:56:45 +0530
From: Rajkumar <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH v2 2/2] ath10k: Increase copy engine entries for rx wmi
Message-ID: <20150210072642.GA27475@qca.qualcomm.com>
References: <1423460814-2767-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1423460814-2767-2-git-send-email-rmanohar@qti.qualcomm.com>
 <54D93A88.8090609@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54D93A88.8090609@codeaurora.org>
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
To: Peter Oh <poh@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Mon, Feb 09, 2015 at 02:54:00PM -0800, Peter Oh wrote:
> 
> On 02/08/2015 09:46 PM, Rajkumar Manoharan wrote:
> Could you explain why the value of nentries are different?
There are separate copy engine configuration tables for host
and target. Host-side and Target-side configurations are different
and it never be same for any CE due to memory constraints in Target.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
