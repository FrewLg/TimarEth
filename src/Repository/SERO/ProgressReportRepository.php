<?php

namespace App\Repository\SERO;

use App\Entity\SERO\ProgressReport;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<ProgressReport>
 *
 * @method ProgressReport|null find($id, $lockMode = null, $lockVersion = null)
 * @method ProgressReport|null findOneBy(array $criteria, array $orderBy = null)
 * @method ProgressReport[]    findAll()
 * @method ProgressReport[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProgressReportRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ProgressReport::class);
    }

    //    /**
    //     * @return ProgressReport[] Returns an array of ProgressReport objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('p')
    //            ->andWhere('p.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('p.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?ProgressReport
    //    {
    //        return $this->createQueryBuilder('p')
    //            ->andWhere('p.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
