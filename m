Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qg0-x243.google.com ([2607:f8b0:400d:c04::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOVx2-0005eZ-5n
 for ath10k@lists.infradead.org; Wed, 27 Jan 2016 19:40:24 +0000
Received: by mail-qg0-x243.google.com with SMTP id 94so1153692qgt.1
 for <ath10k@lists.infradead.org>; Wed, 27 Jan 2016 11:40:03 -0800 (PST)
Date: Wed, 27 Jan 2016 14:39:56 -0500
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: [PATCH 0/4] ath10k: rename mesh and add abstraction layer
Message-ID: <20160127193955.GC12639@localhost>
References: <1453920957-9908-1-git-send-email-poh@qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1453920957-9908-1-git-send-email-poh@qca.qualcomm.com>
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

On Wed, Jan 27, 2016 at 10:55:53AM -0800, Peter Oh wrote:
> Split Mesh service to 11s Mesh and non-11s Mesh according to
> firmware service bit to help users distinguish 11s Mesh from
> non 11s Mesh.
> And add abstraction layer for vdev subtype to solve subtype mismatch
> and to give flexible compatibility among different firmware revisions.

Out of curiosity, which non-11s mesh, if you can share?

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
